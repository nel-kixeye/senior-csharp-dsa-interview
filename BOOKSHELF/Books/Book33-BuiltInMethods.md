# Book 33 — Built-in .NET Methods

> The book of *"don't reinvent the wheel."*

## 1. What problem does this book solve?

The reflex to check the framework **before** writing the loop. .NET's BCL is
enormous, well-tested, and often vectorized. Hand-rolling what it already
provides costs correctness (edge cases you did not consider), performance
(SIMD you did not write), and — in an interview — time you needed for the
actual algorithm.

## 2. The signal

There is only one, and it is a habit rather than a keyword:

> **Before I write 10+ lines, does .NET already have this?**

Concretely, the trigger fires when you are about to write a loop that
*sounds like a verb*: reverse, sort, find, count, clamp, fill, join, split,
trim, chunk, parse, compare, shuffle.

If you can name the operation in one word, there is a good chance it exists.

## 3. The naive instinct

```csharp
// Every one of these already exists
int max = arr[0]; foreach (var x in arr) if (x > max) max = x;
for (int i = 0; i < n/2; i++) (a[i], a[n-1-i]) = (a[n-1-i], a[i]);
int clamped = v < lo ? lo : (v > hi ? hi : v);
for (int i = 0; i < a.Length; i++) a[i] = -1;
bool eq = true; for (...) if (a[i] != b[i]) { eq = false; break; }
```

→ `arr.Max()`, `Array.Reverse(a)`, `Math.Clamp(v, lo, hi)`, `Array.Fill(a, -1)`,
`a.SequenceEqual(b)`.

## 4. Why that is inferior

Beyond line count: BCL implementations handle edge cases (empty, null, overflow)
and many are **hardware-accelerated**. `span.IndexOf`, `SequenceEqual`, and
`Contains` use SIMD; a hand-written loop processes one element per iteration
where the BCL processes 16 or 32.

In an interview, writing `Array.Reverse` and moving on signals that you know the
platform. Hand-rolling it signals the opposite, and burns time.

## 5. The reference — `Math`

```csharp
Math.Max(a, b);        Math.Min(a, b);        Math.Abs(x);
Math.Clamp(v, lo, hi);
Math.Pow(x, y);        Math.Sqrt(x);          Math.Cbrt(x);
Math.Floor(x);         Math.Ceiling(x);       Math.Round(x, digits);
Math.Truncate(x);      Math.Sign(x);
Math.DivRem(a, b, out int rem);      // quotient and remainder in one
Math.BigMul(a, b);                    // full 64-bit product of two ints
Math.Log(x);  Math.Log2(x);  Math.Log10(x);
double.IsNaN(x);  double.IsInfinity(x);
int.MaxValue;  int.MinValue;  long.MaxValue;  double.Epsilon;
```

`Math.Round` uses **banker's rounding** by default — `Math.Round(2.5)` is `2`,
not `3`. Pass `MidpointRounding.AwayFromZero` for the schoolbook behaviour. This
surprises people in financial code.

## 6. The reference — `Array` and `Enumerable`

```csharp
// Array (static, in-place, fast)
Array.Sort(a);              Array.Sort(keys, items);
Array.Reverse(a);           Array.Fill(a, value);
Array.IndexOf(a, v);        Array.LastIndexOf(a, v);
Array.BinarySearch(a, v);   // sorted only
Array.Copy(src, dst, n);    Array.Clear(a);
Array.Exists(a, p);         Array.Find(a, p);       Array.FindIndex(a, p);
Array.TrueForAll(a, p);     Array.ConvertAll(a, f);
Array.Empty<T>();           // allocation-free empty array

// Enumerable (LINQ, lazy, allocating)
seq.Max();  seq.Min();  seq.Sum();  seq.Average();  seq.Count();
seq.MaxBy(f);  seq.MinBy(f);                    // .NET 6 — returns the ITEM
seq.First();  seq.FirstOrDefault();  seq.Last();  seq.Single();
seq.Any(p);  seq.All(p);  seq.Contains(v);
seq.Distinct();  seq.DistinctBy(f);             // .NET 6
seq.OrderBy(f).ThenBy(g);  seq.Reverse();
seq.Take(n);  seq.Skip(n);  seq.TakeWhile(p);  seq.SkipWhile(p);
seq.Chunk(size);                                 // .NET 6 — batching
seq.Zip(other);  seq.SelectMany(f);
seq.GroupBy(f);  seq.ToLookup(f);  seq.ToDictionary(k, v);  seq.ToHashSet();
seq.SequenceEqual(other);
seq.CountBy(f);  seq.AggregateBy(...);           // .NET 9
Enumerable.Range(start, count);
Enumerable.Repeat(value, count);
Enumerable.Empty<T>();
```

`Enumerable.Range(0, n)` replaces a lot of index-generating loops, and composes
with the rest of LINQ (27).

## 7. The reference — strings, collections, bits

```csharp
// string (28)
string.Join(sep, items);      string.Concat(a, b);
string.IsNullOrEmpty(s);      string.IsNullOrWhiteSpace(s);
string.Equals(a, b, StringComparison.OrdinalIgnoreCase);
new string(c, count);         string.Create(len, state, action);
s.Split(sep, StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);

// Parsing — always Try (26, 32)
int.TryParse(s, out int v);
int.TryParse(s, NumberStyles.Integer, CultureInfo.InvariantCulture, out v);
double.TryParse(...);  decimal.TryParse(...);
Enum.TryParse<MyEnum>(s, out var e);
DateTimeOffset.TryParseExact(...);
Guid.TryParse(s, out var g);
Uri.TryCreate(s, UriKind.Absolute, out var uri);

// Collections (29)
list.AsReadOnly();            dict.GetValueOrDefault(k);
dict.TryAdd(k, v);            CollectionsMarshal.AsSpan(list);
seq.ToFrozenSet();            seq.ToFrozenDictionary();   // .NET 8

// Bits (25)
BitOperations.PopCount(x);    BitOperations.IsPow2(x);
BitOperations.LeadingZeroCount(x);  BitOperations.TrailingZeroCount(x);

// Spans (31)
span.IndexOfAny(...);  span.SequenceEqual(...);  span.Trim();
span.CommonPrefixLength(other);   span.Sort();

// Randomness
Random.Shared.Next(min, max);            // thread-safe, .NET 6+
Random.Shared.Shuffle(span);             // .NET 8 — proper Fisher-Yates
RandomNumberGenerator.GetInt32(min, max); // cryptographic
```

`Random.Shared.Shuffle` (.NET 8) is worth knowing: hand-rolled shuffles are
famously easy to get subtly biased, and this one is correct.

## 8. Common mistakes

1. **Hand-rolling what exists.** The theme.
2. **`Math.Round` surprises** — banker's rounding by default.
3. **`Parse` instead of `TryParse`** on untrusted input.
4. **Parsing without `InvariantCulture`** for machine data — decimal separators
   differ by locale, so `"1.5"` fails to parse in a comma-decimal culture.
5. **`new Random()` in a loop** — seeded from the clock, so instances created in
   quick succession produce identical sequences. Use `Random.Shared`.
6. **`Random` for security** — use `RandomNumberGenerator`.
7. **LINQ in hot paths** where `Array.*` in-place methods are cheaper.
8. **`seq.Count() > 0`** instead of `Any()`.
9. **`OrderBy(...).First()`** instead of `MinBy`/`MaxBy` — O(n log n) for an O(n)
   job.
10. **Assuming `Array.Sort` is stable.** It is not; `OrderBy` is (21).

## 9. When to use the built-in

Essentially always, unless one of the cases below applies. The default is: use
the framework, and say so out loud in an interview — "I would use
`Array.Reverse` here, but let me write it out to show the two-pointer logic" is a
strong answer that gets you both.

## 10. When to write it yourself

- **The interview is explicitly testing the implementation** — "implement
  `IndexOf` without using `IndexOf`." Ask if unsure.
- **You need a variant the BCL does not offer** — e.g. `BinarySearch` returning
  the *first* of several duplicates (12).
- **Allocation matters** and the BCL method allocates — LINQ in a hot loop (31).
- **Behaviour differs subtly** — you need `MidpointRounding.AwayFromZero`, or
  ordinal rather than culture comparison.
- **The BCL method has the wrong complexity for your case** — `Contains` on a
  `List` is O(n); you wanted a HashSet (01).
- **You are the one writing the library.**

---

## Production Lens

The senior instinct is not encyclopedic memory of the BCL — it is **suspecting
that a solution exists** and knowing how to check in thirty seconds.

Three habits:

**Search before writing.** Type `.` and read IntelliSense. Most "I need to write
a helper" moments end there.

**Suspect the dependency too.** Before adding a NuGet package, check whether
`System.*` covers it — `System.Text.Json` replaced most JSON.NET use,
`System.Threading.Channels` replaced most hand-rolled queues, `HttpClientFactory`
replaced most HttpClient wrappers.

**Enable the analyzers.** `<AnalysisLevel>latest-recommended</AnalysisLevel>`
turns on rules that flag exactly the mistakes in this book — string
concatenation in loops, `Count() > 0`, missing `StringComparison`,
`OrderBy().First()`. The compiler will teach you the BCL if you let it.

**Related:** [[Book27-LINQ]], [[Book28-StringApis]], [[Book29-Collections]],
[[Book26-Math]], [[Book31-Span-Memory]], [[Book25-BitManipulation]].
