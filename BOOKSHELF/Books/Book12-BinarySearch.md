# Book 12 — Binary Search

> The book of *"can I eliminate half the candidates?"*

## 1. What problem does this book solve?

Finding an answer in O(log n) by halving the search space each step. The
requirement is **not** "the array is sorted." The requirement is **monotonicity**:
there must be a predicate that is false, false, false, then true, true, true —
with a single flip point.

Recognizing that generalization is the difference between solving five binary
search problems and solving fifty.

## 2. Signals

**Level 1 — the obvious:**
- "Sorted array" + "find"
- "O(log n) required"
- "First / last occurrence"
- "Insert position"

**Level 2 — the real skill, binary search on the answer:**
- "Minimize the maximum ..." / "maximize the minimum ..."
- "Smallest / largest value such that ..."
- "Minimum capacity / speed / days / size needed to ..."
- "Can it be done with X?" where **larger X is always at least as easy**
- The answer is a **number in a range**, and checking a candidate is cheap
- Constraints like `1 <= x <= 10^9` with n small — the range is too big to scan
  but log(10^9) is only 30 checks

**The universal test:** *if X works, does every value greater than X also work?*
If yes, binary search the boundary.

## 3. The naive instinct

```csharp
// Find the smallest ship capacity that delivers all packages in D days
for (int cap = maxWeight; cap <= totalWeight; cap++)
    if (CanShip(weights, cap, days)) return cap;      // linear over a huge range
```

## 4. Why that is inferior

The candidate range is often up to 10^9. Linear scanning is hopeless; binary
search needs ~30 iterations. `CanShip` is O(n), so the whole thing is
O(n log(range)) — trivially fast.

The mental shift: you are not searching *the data*, you are searching **the
space of possible answers**. The data is only used by the feasibility check.

## 5. What to recognize

**Use one template and never write another.** The `lo < hi` lower-bound form
below cannot infinite-loop and returns the boundary directly:

```csharp
// Smallest index/value where predicate(x) is TRUE
int lo = 0, hi = n;                 // hi exclusive
while (lo < hi)
{
    int mid = lo + (hi - lo) / 2;   // overflow-safe
    if (Predicate(mid)) hi = mid;   // mid might be the answer — keep it
    else lo = mid + 1;              // mid is not — discard it
}
return lo;                          // == hi, the first true
```

Everything else is a choice of predicate:

| Goal | Predicate |
|---|---|
| First index with `a[i] >= target` (lower bound) | `a[mid] >= target` |
| First index with `a[i] > target` (upper bound) | `a[mid] > target` |
| First occurrence of target | lower bound, then verify `a[lo] == target` |
| Last occurrence of target | upper bound, then `lo - 1` |
| Count of target | `upperBound - lowerBound` |
| Min feasible capacity | `CanDo(mid)` |

**Binary search on the answer** — same template, different domain:

```csharp
int lo = minPossible, hi = maxPossible;
while (lo < hi)
{
    int mid = lo + (hi - lo) / 2;
    if (Feasible(mid)) hi = mid;
    else lo = mid + 1;
}
return lo;
```

## 6. Complexity

| | Time | Space |
|---|---|---|
| Classic search | O(log n) | O(1) |
| Binary search on answer | O(log(range) * cost of check) | O(1) |
| On a rotated array | O(log n) | O(1) |
| 2D sorted matrix | O(log(r * c)) | O(1) |

log2(10^9) ≈ 30. log2(10^18) ≈ 60. The range being astronomically large is
almost irrelevant — which is exactly why it works.

## 7. C# APIs

```csharp
int i = Array.BinarySearch(sorted, target);
// >= 0 : an index of a match (not necessarily the first!)
// <  0 : ~i is the insertion point
int insertionPoint = i < 0 ? ~i : i;

int j = list.BinarySearch(target);
int k = Array.BinarySearch(arr, index, length, target);
Array.BinarySearch(arr, target, comparer);

// Span version, .NET 8+
sortedSpan.BinarySearch(target);
```

The `~` trick is worth internalizing: `Array.BinarySearch` returning `-5` means
"not found; it belongs at index 4." That gives you a lower bound for free.

**Two caveats.** `Array.BinarySearch` does not promise the *first* match when
duplicates exist — for first/last occurrence, write the template. And it is
undefined behaviour on unsorted input: no exception, just a wrong answer.

## 8. Common mistakes

1. **Overflow**: `(lo + hi) / 2` overflows for large ints. Always
   `lo + (hi - lo) / 2`.
2. **Infinite loops** from `lo = mid` instead of `lo = mid + 1`. The `lo < hi`
   template above avoids this by construction — which is why you should use one
   template exclusively.
3. **Inclusive vs exclusive `hi`.** Pick one convention and never mix.
4. **Assuming `Array.BinarySearch` gives the first duplicate.** It does not.
5. **Searching unsorted data.** Silently wrong.
6. **Not verifying the result.** Lower bound returns an insertion point even
   when the target is absent — check `lo < n && a[lo] == target`.
7. **Non-monotone predicate.** If feasibility flips back and forth, binary
   search is invalid. Verify monotonicity before trusting it.
8. **Off-by-one in "answer space" bounds** — `hi` must be a value known to be
   feasible, or you can return a value that is not.

## 9. Correct-book problems

**Classic:**
- Binary Search; Search Insert Position
- First Bad Version
- Find First and Last Position of Element in Sorted Array
- Search in Rotated Sorted Array I/II; Find Minimum in Rotated Sorted Array
- Search a 2D Matrix (treat as a flat sorted array)
- Peak Element (monotone on the slope, works on unsorted input)
- Sqrt(x); Valid Perfect Square

**On the answer — the ones that build the real skill:**
- Koko Eating Bananas — minimum eating speed
- Capacity To Ship Packages Within D Days
- Split Array Largest Sum — minimize the maximum subarray sum
- Minimum Number of Days to Make m Bouquets
- Find the Smallest Divisor Given a Threshold
- Magnetic Force Between Two Balls — maximize the minimum gap
- Median of Two Sorted Arrays (partition search — the hard one)
- Kth Smallest Element in a Sorted Matrix

## 10. Where Binary Search looks right but is wrong

- **Unsorted data with no monotone predicate.** Sorting first costs O(n log n),
  which defeats an O(log n) goal if you search only once — a linear scan is O(n)
  and cheaper.
- **You need *all* matches** — binary search finds a boundary; use lower/upper
  bound pair, or just scan.
- **The data changes constantly** → SortedSet (08) or a tree.
- **Small n.** A linear scan wins on constants and clarity below roughly 50
  elements.
- **The feasibility check is expensive** — O(log(range) * expensive) may lose to
  a smarter direct algorithm.
- **The predicate is not monotone** — "find any peak" works, "find the global
  maximum of an arbitrary array" does not.
- **Hash lookup would answer it** — exact-match membership on unsorted data is a
  HashSet at O(1), better than sorting to get O(log n) (01).

---

## Production Lens

Binary search on the answer is quietly one of the most useful production
techniques: calibrating a rate limit, finding a batch size that fits a memory
budget, sizing a thread pool, locating a version boundary. `git bisect` is
binary search on the answer over commits.

For lookups over static sorted data, measure before choosing: a `FrozenSet` or
`Dictionary` hash lookup usually beats binary search over an array despite the
asymptotics, because hashing is one cache miss and binary search is log n of
them. Binary search wins when you need *ordering* facts (nearest, range,
predecessor) rather than exact matches.

**Related:** [[Book21-Sorting]], [[Book08-SortedSet-SortedDictionary]],
[[Book09-TwoPointers]], [[Book03-Array-List]].
