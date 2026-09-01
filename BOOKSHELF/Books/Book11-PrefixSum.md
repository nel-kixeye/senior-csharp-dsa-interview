# Book 11 — Prefix Sum

> The book of *"precompute once, answer forever."*

## 1. What problem does this book solve?

Converting repeated **range** queries from O(n) each into O(1) each, by paying
O(n) once up front. The identity is trivial and the leverage is enormous:

```
sum(i..j) = prefix[j + 1] - prefix[i]
```

## 2. Signals

- "Sum of elements between index i and j" — **asked many times**
- "Range sum query" / "range query"
- "Subarray sum equals K"
- "Count subarrays where…" (sum, parity, balance)
- "Running total" / "cumulative"
- "Average of a range"
- "Equal number of X and Y" → map one to +1 and the other to -1, then it is a
  prefix-sum problem
- "Pivot index" / "equilibrium point"
- "Product of array except self" (prefix/suffix products, same idea)
- 2D: "sum of a rectangle in a matrix"

**The tell:** you are computing a sum over a range *inside a loop*.

**The second, deeper tell:** "count subarrays with property X" where X is
expressible as a difference of prefixes. That is where prefix sum + Dictionary
becomes the answer, and it is not obvious.

## 3. The naive instinct

```csharp
// Answer q range-sum queries
foreach (var (i, j) in queries)
{
    int sum = 0;
    for (int k = i; k <= j; k++) sum += nums[k];   // O(n) per query
    Console.WriteLine(sum);
}
```

## 4. Why that is inferior

O(q * n). With 10^5 queries over 10^5 elements that is 10^10 operations. Prefix
sums make it O(n + q).

The counting variant is even more dramatic: "how many subarrays sum to K" is
O(n^2) by brute force over all start/end pairs, and **O(n)** with prefix sums
plus a Dictionary. That is not a constant-factor win; it is the difference
between passing and timing out.

## 5. What to recognize

**The array** — note the `n + 1` length and the leading zero. That sentinel
removes every special case for ranges starting at 0:

```csharp
var prefix = new long[nums.Length + 1];        // long: guard against overflow
for (int i = 0; i < nums.Length; i++)
    prefix[i + 1] = prefix[i] + nums[i];

long RangeSum(int i, int j) => prefix[j + 1] - prefix[i];   // inclusive i..j
```

**The Dictionary combination** — the pattern worth memorizing, because it is
where prefix sums stop being obvious:

```csharp
// Count subarrays summing to exactly k  (works with negative numbers)
var seen = new Dictionary<long, int> { [0] = 1 };   // empty prefix, seen once
long running = 0; int count = 0;

foreach (int x in nums)
{
    running += x;
    // a subarray ending here sums to k iff some earlier prefix == running - k
    count += seen.GetValueOrDefault(running - k);
    seen[running] = seen.GetValueOrDefault(running) + 1;
}
```

The `[0] = 1` seed is essential and constantly forgotten: it accounts for
subarrays that start at index 0.

**The +1/-1 transform** — "equal numbers of 0s and 1s" becomes "prefix sum
returns to a previous value." Any balance question can become a prefix-sum
question this way.

**2D prefix (integral image)**:

```csharp
// sum of rectangle (r1,c1)..(r2,c2)
long S = P[r2+1, c2+1] - P[r1, c2+1] - P[r2+1, c1] + P[r1, c1];
```

Inclusion-exclusion: subtract the two overlapping strips, add back the corner
you subtracted twice.

## 6. Complexity

| | Build | Query | Space |
|---|---|---|---|
| 1D prefix sum | O(n) | O(1) | O(n) |
| 2D prefix sum | O(r * c) | O(1) | O(r * c) |
| Prefix + Dictionary counting | — | O(n) total | O(n) |
| Difference array (range updates) | O(n) | O(1) per update | O(n) |

**Difference array** is the mirror image: to apply many range *updates* and read
the array once at the end, do `diff[i] += v; diff[j+1] -= v;` per update, then
prefix-sum the whole thing once. Range update O(1), final read O(n). This is the
right tool for "book n flights on days i..j" problems.

## 7. C# specifics

```csharp
// Watch the accumulator type — this is the classic bug
var prefix = new long[n + 1];        // not int[]

// Built-in running aggregate
IEnumerable<int> running = nums.Select((x, i) => nums.Take(i + 1).Sum()); // O(n^2) — do NOT
// use an explicit loop, or:
long acc = 0;
var pre = nums.Select(x => acc += x).ToArray();   // works, but the closure is subtle

// In place, when you may destroy the input
for (int i = 1; i < nums.Length; i++) nums[i] += nums[i - 1];
```

`Enumerable.Aggregate` computes a single fold, not the intermediate prefixes.
There is no BCL "running scan" for arrays, so the explicit loop is idiomatic.

## 8. Common mistakes

1. **Integer overflow.** Sums of `int` exceed `int`. Use `long`. This is the
   most common prefix-sum bug in practice.
2. **Off-by-one on inclusive vs exclusive bounds.** Build with the `n+1` leading
   zero and the formula stops being error-prone.
3. **Forgetting `seen[0] = 1`** in the counting pattern — subarrays starting at
   index 0 go uncounted.
4. **Using a sliding window instead** when the array has negative numbers.
5. **Rebuilding the prefix array inside the query loop.** Build once.
6. **Applying it to a mutable array.** If elements change between queries,
   prefix sums are invalidated → Fenwick tree / segment tree.
7. **Counting vs finding.** `Dictionary<sum, count>` counts subarrays;
   `Dictionary<sum, firstIndex>` finds the longest one. Different problems,
   different value type.

## 9. Correct-book problems

- Range Sum Query — Immutable (the definitional problem)
- Subarray Sum Equals K — the archetype of the Dictionary combination
- Contiguous Array — equal 0s and 1s via the +1/-1 transform
- Find Pivot Index; Find the Middle Index
- Product of Array Except Self — prefix/suffix products
- Range Sum Query 2D — Immutable
- Continuous Subarray Sum — prefix modulo k
- Subarray Sums Divisible by K — prefix modulo counts
- Corporate Flight Bookings; Car Pooling — difference array
- Maximum Size Subarray Sum Equals k — `Dictionary<sum, firstIndex>`
- Number of Submatrices That Sum to Target (2D + the 1D trick)

## 10. Where Prefix Sum looks right but is wrong

- **The array changes between queries** → Fenwick tree (BIT) or segment tree.
  Prefix sums are for static data.
- **You need the maximum of a range, not the sum** — max is not invertible, so
  the subtraction trick fails → sparse table or segment tree.
- **A single range sum, queried once** — just loop. Building a prefix array for
  one query is wasted work.
- **Non-contiguous elements** → not a prefix-sum problem.
- **All values are non-negative and you want the *longest/shortest* subarray
  meeting a threshold** → Sliding Window (10) is simpler and O(1) space.
- **Maximum subarray sum** → Kadane's algorithm is simpler and O(1) space,
  though the prefix framing (`max(prefix[j] - min prefix[i<j])`) also works and
  is worth knowing as a bridge to DP (19).

---

## Production Lens

Prefix sums are precomputed indexes, and the production question is the one
every index raises: **what invalidates it?** A cached cumulative table over data
that mutates is a correctness bug waiting to happen.

Real analogues: materialized views, OLAP cubes, running-total columns in
reporting tables, and integral images in image processing. In all of them the
hard part is invalidation, not construction.

If sums are over money, use `decimal` and remember it does not overflow silently
the way `int` does — it throws.

**Related:** [[Book02-Dictionary]], [[Book10-SlidingWindow]],
[[Book26-Math]], [[Book19-DynamicProgramming]].
