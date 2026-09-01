# Exercises — Book 31: Span / Memory / Allocation

**Different in character.** Rewrite exercises plus one "why won't this compile".
**The senior recognition is not "use spans everywhere"** — it is *".NET already
has an allocation-free path for this."*
**Measure first.** These techniques are for hot paths, not ordinary logic.

---

### E31.1 — Parse without allocating
Rewrite this to allocate nothing per field.

```csharp
long Total(string line)      // line is like "10,20,30,40,..." with 100,000 fields
{
    long total = 0;
    foreach (var part in line.Split(','))
        total += int.Parse(part);
    return total;
}
```

- **Before you code:** count the allocations in the original for a line with `k`
  fields. Then write the span version.
- **Target:** zero allocations.

### E31.2 — Substring in a loop
This scans a large log line looking for a prefix match at each position.

```csharp
for (int i = 0; i < line.Length - len; i++)
    if (line.Substring(i, len) == target)
        return i;
```

- **Rewrite it** with no allocation.
- **Then:** name the BCL method that makes the whole loop unnecessary, and say what
  it does that a hand-written loop probably does not (hint: it is about how many
  characters the CPU compares at once).

### E31.3 — The stack-allocated frequency buffer
Rewrite an anagram check (Book 24) to use `stackalloc` instead of a
`Dictionary<char,int>`.

- **Then answer these, which matter more than the rewrite:**
  1. Why is `stackalloc` inside a **loop** dangerous, and what is the failure mode?
  2. Write the guard pattern for a buffer whose size depends on input.
  3. What is a safe upper bound for a `stackalloc` in bytes, roughly?

### E31.4 — Rent instead of allocate
You process 10,000 messages/second, each needing a temporary `byte[]` of about
64 KB.

- **Rewrite** the naive `new byte[65536]` version using `ArrayPool<byte>.Shared`.
- **Before you code:** name the three things you must get right when using
  `ArrayPool` — one about the returned array's **size**, one about its **contents**,
  and one about **when** you give it back.
- **Then:** why does 64 KB matter specifically? What threshold is it near, and what
  changes above that threshold?

### E31.5 — Why won't this compile?
Each fails. Name the rule and give a fix.

```csharp
// A
class Parser { private ReadOnlySpan<char> _buffer; }

// B
async Task<int> CountAsync(ReadOnlySpan<char> text) { await Task.Delay(1); return text.Length; }

// C
IEnumerable<int> Lengths(ReadOnlySpan<char> s) { yield return s.Length; }

// D
Span<char> Build() { Span<char> buf = stackalloc char[64]; buf[0] = 'x'; return buf; }
```

- **Before you look:** all four have the **same underlying cause**. Name it once,
  then say how each one manifests it.

---
---

# ⛔ STOP — hints below

---

**E31.1**
- *Allocations in the original:* one `string[]` array **plus one string per field**
  — so 100,001 allocations for a 100,000-field line, all immediately garbage.
- *Skeleton (.NET 8+):*
  ```
  long Total(string line) {
      long total = 0;
      ReadOnlySpan<char> s = line;
      foreach (var range in s.Split(','))          // allocation-free enumerator
          total += int.Parse(s[range]);            // parses the slice in place
      return total;
  }
  ```
- *Pre-.NET 8:* walk manually with `s.IndexOf(',')`, slice, parse, re-slice the
  remainder.

**E31.2**
- *Rewrite:* `if (line.AsSpan(i, len).SequenceEqual(target))` — `AsSpan` is O(1)
  and allocates nothing, where `Substring` allocated a new string every iteration.
- *The method:* `line.IndexOf(target, StringComparison.Ordinal)` — or
  `line.AsSpan().IndexOf(target)`. It is **vectorized**: it compares 16 or 32
  characters per SIMD instruction instead of one per iteration. A hand-written loop
  gets neither that nor the tuned search algorithm underneath.

**E31.3**
- *Rewrite:* `Span<int> count = stackalloc int[26];` then index with `c - 'a'` —
  zero allocation, better locality than a Dictionary.
1. *The danger:* stack memory is **not reclaimed until the method returns**, so a
   `stackalloc` inside a loop accumulates every iteration. The failure is
   `StackOverflowException`, which in .NET **cannot be caught** — the process dies.
2. *The guard:*
   ```
   Span<char> buf = len <= 256 ? stackalloc char[256] : new char[len];
   ```
   Small and bounded goes on the stack; anything larger falls back to the heap.
3. *Safe bound:* keep it under about **1 KB**. The default thread stack is 1 MB
   total and you are sharing it with every frame below you.

**E31.4**
- *Skeleton:*
  ```
  byte[] buffer = ArrayPool<byte>.Shared.Rent(65536);
  try     { var span = buffer.AsSpan(0, 65536); /* use span */ }
  finally { ArrayPool<byte>.Shared.Return(buffer); }
  ```
- *The three things:*
  1. **Size:** `Rent` may return an array **larger** than requested. Always slice to
     the length you asked for; never trust `buffer.Length`.
  2. **Contents:** the array is **not cleared** — it holds whatever the previous
     renter left. Overwrite before reading, or pass `clearArray: true` to `Return`
     if it held sensitive data.
  3. **When:** return it in a `finally`, exactly once. Returning twice, or using it
     after returning, is a corruption bug that surfaces far from its cause.
- *Why 64 KB:* it is close to the **85,000-byte Large Object Heap threshold**.
  Arrays at or above that go on the LOH, which is collected only with gen2 and is
  not compacted by default — so churning them fragments the heap. Pooling avoids
  both the allocation and the fragmentation.

**E31.5**
- *The one cause:* `Span<T>` and `ReadOnlySpan<T>` are **`ref struct`s**. They are
  guaranteed to live only on the stack, so they can never be stored anywhere that
  might outlive or escape the current stack frame.
- **A:** a class field lives on the heap. → store `ReadOnlyMemory<char>` and call
  `.Span` at the point of use.
- **B:** an `async` method's locals are hoisted into a heap-allocated state machine.
  → take `ReadOnlyMemory<char>` and convert inside the synchronous portion.
- **C:** an iterator is compiled into a heap-allocated state machine, same as
  async. → return a materialized collection, or use a custom `ref struct`
  enumerator.
- **D:** the `stackalloc` buffer dies when `Build` returns — the span would dangle.
  The compiler catches this. → return `char[]`, or accept a caller-provided
  `Span<char>` destination and write into it.
