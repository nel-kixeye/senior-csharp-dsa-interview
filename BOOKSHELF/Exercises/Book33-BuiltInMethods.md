# Exercises — Book 33: Built-in .NET Methods

**The final book, and the one habit that outlives the interview:**

> Before I write 10 lines, does .NET already have this?

If you can name the operation in one word — reverse, clamp, fill, join, chunk,
shuffle, count, parse — it probably exists.

---

### E33.1 — Delete the reinvented wheel
Replace each with a BCL call. Then, for each, say whether the hand-rolled version
is merely *longer* or actually *wrong* in some case.

```csharp
// A
int max = arr[0]; foreach (var x in arr) if (x > max) max = x;

// B
for (int i = 0; i < n / 2; i++) (a[i], a[n-1-i]) = (a[n-1-i], a[i]);

// C
int v2 = value < min ? min : (value > max ? max : value);

// D
for (int i = 0; i < arr.Length; i++) arr[i] = -1;

// E
bool same = a.Length == b.Length;
if (same) for (int i = 0; i < a.Length; i++) if (a[i] != b[i]) { same = false; break; }

// F
var batches = new List<List<int>>();
for (int i = 0; i < items.Count; i += 100) batches.Add(items.GetRange(i, Math.Min(100, items.Count - i)));

// G
int q = a / b; int r = a - q * b;

// H
var shuffled = items.OrderBy(_ => Guid.NewGuid()).ToList();
```

- **Before you code:** G and H are the two that are genuinely *wrong*, not just
  verbose. Find out why.

### E33.2 — The rounding trap
Predict the output of each, then run it.

```csharp
Math.Round(2.5);
Math.Round(3.5);
Math.Round(2.5, MidpointRounding.AwayFromZero);
Math.Round(2.675, 2);
(int)(2.7);
Math.Floor(-2.1);
(int)(-2.7);
```

- **Explain** the default behaviour and name it.
- **Then:** which of these would you use to round a **currency** amount, and what
  type should that amount be in the first place?

### E33.3 — Randomness pitfalls
Each has a real bug. Name it and fix it.

```csharp
// A
for (int i = 0; i < 1000; i++) { var r = new Random(); results.Add(r.Next(100)); }

// B — generating a password reset token
var token = new Random().Next(100000, 999999).ToString();

// C — shuffling a deck
cards.Sort((x, y) => Random.Shared.Next(-1, 2));

// D — called from multiple threads
private static readonly Random _rng = new Random();
public int Roll() => _rng.Next(1, 7);
```

### E33.4 — Name the method
For each description, name the BCL member. No searching — this is a recall drill.

1. Restrict a value to a range.
2. Quotient and remainder in one call.
3. Split a sequence into fixed-size batches.
4. Return the element with the largest key, not the key itself.
5. Count the set bits in an integer, as one CPU instruction.
6. Test whether a sequence is element-wise equal to another.
7. Fill an array with a repeated value.
8. Get a dictionary value, or a default if the key is missing.
9. Create a string of one character repeated n times.
10. Produce a sequence of integers from a start and a count.
11. Shuffle a span in place, correctly.
12. Parse a string to an int without throwing on bad input.

### E33.5 — When to write it yourself
Give a concrete case for each where hand-rolling beats the BCL call, and say what
you would do instead.

1. `Array.BinarySearch`
2. `Math.Round`
3. LINQ's `Where` + `Select`
4. `string.Split`
5. `list.Contains`

---
---

# ⛔ STOP — hints below

---

**E33.1**
- **A:** `arr.Max()` — merely longer. (Though the hand-rolled version throws
  `IndexOutOfRange` on an empty array where `Max()` throws a clearer
  `InvalidOperationException`.)
- **B:** `Array.Reverse(a)` — longer.
- **C:** `Math.Clamp(value, min, max)` — longer.
- **D:** `Array.Fill(arr, -1)` — longer.
- **E:** `a.SequenceEqual(b)`, or `a.AsSpan().SequenceEqual(b)` for the vectorized
  version — longer, and slower (no SIMD).
- **F:** `items.Chunk(100)` (.NET 6+) — longer.
- **G: WRONG.** For negative operands C#'s truncation makes this subtly
  inconsistent with `%`, and it does an extra multiply. Use
  `Math.DivRem(a, b, out int r)`.
- **H: WRONG.** `OrderBy` with a random key is not a uniform shuffle — the
  comparison-based sort with an inconsistent key produces a biased distribution
  (and can throw `InvalidOperationException` for an inconsistent comparer). Use
  `Random.Shared.Shuffle(span)` (.NET 8+) or a hand-written Fisher–Yates.

**E33.2**
```
Math.Round(2.5)                            -> 2    (!)
Math.Round(3.5)                            -> 4
Math.Round(2.5, MidpointRounding.AwayFromZero) -> 3
Math.Round(2.675, 2)                       -> 2.67 (!) binary representation
(int)(2.7)                                 -> 2    truncation, not rounding
Math.Floor(-2.1)                           -> -3
(int)(-2.7)                                -> -2   truncates toward ZERO
```
- *The default is **banker's rounding*** (round-half-to-even) — it reduces
  cumulative bias across many roundings, which is why it is the default, and it
  surprises everyone the first time.
- *Currency:* use `decimal`, not `double` — `2.675` is not exactly representable in
  binary floating point, which is why that line rounds "wrong". Then
  `Math.Round(amount, 2, MidpointRounding.AwayFromZero)` if your domain requires
  schoolbook rounding (many financial rules do; check which).

**E33.3**
- **A:** `new Random()` seeded from the clock; instances created in a tight loop can
  get the **same seed** and produce identical sequences. → use `Random.Shared`.
  (On .NET 6+ the parameterless constructor is thread-safe-seeded, so this is less
  catastrophic than it was — but it is still wasteful and still wrong in spirit.)
- **B:** `Random` is **not cryptographically secure** — a reset token from it is
  predictable. → `RandomNumberGenerator.GetInt32(...)`, or better, a longer token
  from `RandomNumberGenerator.GetBytes`.
- **C:** a comparator that returns random values is **inconsistent**; the sort may
  throw `InvalidOperationException` and, when it does not, the result is biased. → 
  `Random.Shared.Shuffle(CollectionsMarshal.AsSpan(cards))`.
- **D:** `Random` instance methods are **not thread-safe**; concurrent calls can
  corrupt its internal state and return zeros. → `Random.Shared` (thread-safe since
  .NET 6), or `[ThreadStatic]` instances.

**E33.4**
1. `Math.Clamp` 2. `Math.DivRem` 3. `Enumerable.Chunk` 4. `MaxBy`
5. `BitOperations.PopCount` 6. `SequenceEqual` 7. `Array.Fill`
8. `GetValueOrDefault` 9. `new string(c, n)` 10. `Enumerable.Range`
11. `Random.Shared.Shuffle` 12. `int.TryParse`

**E33.5**
1. **`Array.BinarySearch`** does not promise the **first** of several equal
   elements. Write the lower-bound template when you need first/last occurrence
   (Book 12).
2. **`Math.Round`** defaults to banker's rounding. Pass `MidpointRounding` — or
   write domain-specific rounding when regulation dictates it.
3. **LINQ** allocates an enumerator per operator and a closure per lambda. In a
   profiled hot loop, a single `for` doing both operations in one pass wins.
4. **`string.Split`** allocates an array plus every substring. In a hot parser, use
   `AsSpan` + `IndexOf`, or `MemoryExtensions.Split` (Book 31).
5. **`list.Contains`** is O(n). If you call it inside a loop you do not want a
   better `Contains` — you want a `HashSet` (Book 01). This is the one where the
   answer is not "write it yourself" but "use a different collection entirely."
