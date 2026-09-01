# Book 31 — Span / Memory / Allocation Awareness

> The book of *"look at the data without copying it."*

Senior-level but practical. The point is **recognizing that .NET already has
tools for this** — not becoming a performance specialist.

## 1. What problem does this book solve?

Working with slices of existing data without allocating. `Span<T>` is a
type-safe view over contiguous memory — an array, a string, a stack buffer, or
unmanaged memory — with the cost of a slice reduced from O(n) copy to O(1)
pointer arithmetic.

## 2. Signals

- "Parse a large string / file / buffer"
- `Substring` inside a loop
- Hot path shows up in a profiler as allocation-heavy
- "High throughput" / "low latency" / "avoid GC pressure"
- Processing chunks of a large array or buffer
- Network, file, or serialization code
- You are slicing but never *keeping* the slice
- Repeated small temporary arrays
- "Do this without allocating"

**The tell:** you are *reading* a portion of data, and the current code copies it
to do so.

## 3. The naive instinct

```csharp
// Sum the comma-separated numbers in a long string
long total = 0;
foreach (var part in input.Split(','))          // allocates array + every part
    total += int.Parse(part);                   // and each part is a new string
```

## 4. Why that is inferior

For a 1 MB input with 100,000 fields, that allocates an array plus 100,000
strings — several megabytes of garbage to compute one number. Every one of those
strings is copied out of the source and then immediately discarded.

The span version reads the same bytes in place:

```csharp
long total = 0;
ReadOnlySpan<char> s = input;
foreach (var range in s.Split(','))             // .NET 8+, allocation-free
    total += int.Parse(s[range]);               // parses the slice directly
```

Zero allocations. Same answer. On large inputs this is often a 5–10x wall-clock
difference, almost entirely from not producing garbage.

## 5. What to recognize

```csharp
// Slicing without copying — the core move
ReadOnlySpan<char> span = someString;
var slice = span.Slice(10, 20);           // O(1), no allocation
var slice2 = span[10..30];                // same, range syntax

int[] arr = ...;
Span<int> s = arr;                        // writable view
Span<int> mid = s[2..8];
mid[0] = 99;                              // WRITES THROUGH to arr[2]

// Stack allocation for small fixed buffers — no heap, no GC
Span<int> counts = stackalloc int[26];    // classic char-frequency buffer (24)

// String slicing without Substring
bool starts = input.AsSpan(5, 3).SequenceEqual("abc");

// Zero-copy view over a List<T>
Span<int> listSpan = CollectionsMarshal.AsSpan(list);
```

**`MemoryExtensions` gives you the algorithms already** — these are the
hand-written loops you do not need to write:

```csharp
span.IndexOf(value);         span.IndexOfAny('a', 'b');
span.Contains(value);        span.SequenceEqual(other);
span.StartsWith(prefix);     span.EndsWith(suffix);
span.Trim();                 span.TrimStart();
span.Slice(start, length);   span.Reverse();
span.Sort();                 span.BinarySearch(value);
span.CommonPrefixLength(other);            // .NET 8+
span.Count(value);                          // .NET 8+
span.Split(destination, ',');               // .NET 8+, allocation-free
```

**`Memory<T>` when you need to cross an `await`** — `Span<T>` is a `ref struct`
and cannot live on the heap, so it cannot be used in async methods:

```csharp
async Task ProcessAsync(Memory<byte> buffer)
{
    await stream.ReadAsync(buffer);        // Memory works here
    Process(buffer.Span);                  // convert to Span for synchronous work
}
```

**`ArrayPool<T>` for large temporary buffers** — rent instead of allocating:

```csharp
var buffer = ArrayPool<byte>.Shared.Rent(size);   // may return a LARGER array
try     { /* use buffer.AsSpan(0, size) */ }
finally { ArrayPool<byte>.Shared.Return(buffer); }
```

## 6. Cost model

| Operation | Cost | Allocates |
|---|---|---|
| `AsSpan()` / `Slice()` | O(1) | **no** |
| `Substring()` | O(len) | **yes** |
| `stackalloc` | O(1) | no heap |
| `ToArray()` on a span | O(n) | yes |
| `string.Split` | O(n) | yes, many |
| `span.Split` (.NET 8+) | O(n) | **no** |
| `ArrayPool.Rent` | ~O(1) | no (reuses) |

Arrays over **85,000 bytes** go on the Large Object Heap, which is collected
with gen2 and is not compacted by default — a real source of fragmentation.
`ArrayPool` exists largely for this.

## 7. C# specifics and restrictions

`Span<T>` is a `ref struct`. That means it:

- lives only on the stack
- **cannot** be a field of a class
- **cannot** be used in `async` methods or iterators (`yield`)
- **cannot** be boxed, captured in a lambda, or stored in a collection

Use `Memory<T>` in those cases and call `.Span` at the point of synchronous use.

`stackalloc` safety: keep it small (a few hundred bytes to ~1 KB) and **never**
inside a loop — the stack frame does not reclaim it until the method returns, so
`stackalloc` in a loop is a stack overflow waiting to happen. The idiomatic
guard:

```csharp
Span<char> buf = len <= 256 ? stackalloc char[256] : new char[len];
```

## 8. Common mistakes

1. **`stackalloc` in a loop** or with a size derived from input — stack
   overflow, uncatchable.
2. **Trying to use `Span<T>` in an async method** — compile error; reach for
   `Memory<T>`.
3. **Returning a span over a `stackalloc` buffer** — the memory is gone. (The
   compiler catches most of these; not all.)
4. **Forgetting `ArrayPool` returns an array at least as large as requested** —
   always slice to the length you asked for, and do not trust the contents to be
   zeroed.
5. **Not returning rented arrays** (use `try/finally`) — a slow leak.
6. **Mutating a `Span<T>` and being surprised** that the source array changed.
   That is the point; be deliberate.
7. **Micro-optimizing without measuring.** Spans add friction; spend it where a
   profiler says it matters.
8. **`ToArray()` on a span**, which re-introduces the copy you were avoiding.

## 9. Where spans genuinely pay off

- Parsing large text: logs, CSV, protocols
- Slicing inside a hot loop
- Fixed-size scratch buffers (`stackalloc int[26]` for character counts)
- Binary/network buffer processing
- Two-pointer and sliding-window algorithms over strings (09, 10)
- Avoiding `Substring` when you only compare or parse
- Serialization and encoding paths

## 10. Where reaching for spans is the wrong move

- **Ordinary business logic.** Readability wins; the allocation is irrelevant.
- **Interview code**, unless asked about performance — mention it as a
  refinement, do not lead with it.
- **Async-heavy code** — the `ref struct` restrictions fight you; use `Memory<T>`
  and only where it matters.
- **You need to store or return the slice** — a span cannot outlive the stack
  frame; you need a copy or a `Memory<T>`.
- **The data is not contiguous** — linked lists, trees, and `IEnumerable`
  sequences have no span.
- **Before profiling.** The complexity cost is real and the benefit is often
  zero outside hot paths.
- **`List<T>` you will mutate structurally** — `CollectionsMarshal.AsSpan` is
  invalidated by any Add/Remove.

---

## Production Lens

The senior recognition here is not "write span code everywhere." It is:

**.NET already has an allocation-free path for most common operations** —
parsing, slicing, searching, splitting, formatting. When a profiler shows
allocation pressure in a hot path, the answer is usually an existing
`MemoryExtensions` or `Utf8Formatter` API, not a hand-rolled optimization.

The realistic decision order:

1. Is this actually hot? Measure. If not, stop — write the clear version.
2. Is the allocation avoidable with an existing API? (`AsSpan`, `TryFormat`,
   `Utf8Parser`, `ArrayPool`.)
3. Only then consider restructuring.

`System.IO.Pipelines` is the framework-level answer for high-throughput stream
parsing, and it is built on this machinery.

**Related:** [[Book24-Strings]], [[Book28-StringApis]],
[[Book30-StringBuilder]], [[Book03-Array-List]], [[Book29-Collections]].
