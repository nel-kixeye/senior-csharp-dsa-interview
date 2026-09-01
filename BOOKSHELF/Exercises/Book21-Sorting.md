# Exercises — Book 21: Sorting

**Reach for it when:** sorting would make the rest obvious — pairs become
neighbours, greedy becomes valid, grouping becomes a scan.
**Watch:** never write `(a, b) => a - b` (overflow). `Array.Sort` is **unstable**;
`OrderBy` is stable.

---

### E21.1 — Largest Number
Given non-negative integers, arrange them to form the largest possible number.
Return it as a string.

Example: `[3, 30, 34, 5, 9]` → `"9534330"`.

- **Constraints:** up to 100 numbers, each up to 10⁹.
- **Target:** O(n log n · L).
- **Edge cases:** **all zeroes** (`[0, 0]` must give `"0"`, not `"00"`); single
  number; numbers where one is a prefix of another (`[3, 30]`).
- **Before you code:** the default numeric and lexicographic orders are both
  wrong. State the comparison rule for two numbers `a` and `b` — it involves
  concatenating them.

### E21.2 — H-Index
Given citation counts per paper, return the h-index: the largest `h` such that at
least `h` papers have at least `h` citations each.

- **Constraints:** up to 5000 papers; citations 0–1000.
- **Target:** O(n log n) sorting, or **O(n)** with counting.
- **Edge cases:** all zeroes (h = 0); a single paper with many citations (h = 1);
  every paper cited more than `n` times (h = n).
- **Before you code:** sort descending and scan — what is the stopping condition?
  Then: the citation counts are bounded, so what linear-time approach exists?

### E21.3 — Minimum Absolute Difference
Return all pairs of elements with the minimum absolute difference, each pair
sorted ascending, and the list sorted by the first element.

- **Constraints:** up to 10⁵ elements; values may be negative.
- **Target:** O(n log n) time.
- **Edge cases:** duplicates (difference 0); exactly two elements; all equal;
  negative values where subtraction could overflow.
- **Before you code:** after sorting, which pairs can possibly be the closest? The
  answer eliminates O(n²) comparisons in one sentence.

### E21.4 — Custom Sort String
Given an `order` string listing distinct characters, sort a second string `s` so
its characters follow that order. Characters not in `order` may go anywhere.

- **Constraints:** both up to 200 lowercase characters.
- **Target:** O(n) time with counting, or O(n log n) with a comparer.
- **Edge cases:** `s` contains characters not in `order`; `order` contains
  characters not in `s`; duplicate characters in `s`; empty `order`.
- **Before you code:** two valid approaches — a custom comparer, or counting. Name
  both and say which is faster and why.

### E21.5 — Car Fleet
Cars at given positions travel toward a target at given speeds. A faster car
catching a slower one joins its fleet and travels at the slower speed. Return the
number of fleets that arrive.

- **Constraints:** up to 10⁵ cars; distinct positions.
- **Target:** O(n log n) time.
- **Edge cases:** one car; all cars same speed (each is its own fleet unless they
  start... think it through); a car already at the target; cars that catch up
  exactly at the target (they **do** merge).
- **Before you code:** two books. Sort by what, and in which direction? Then: what
  does the second structure hold, and what does "the car ahead arrives later than
  me" imply?

---
---

# ⛔ STOP — hints below

---

**E21.1**
- *Rule:* order `a` before `b` when `a+b` (concatenated) is greater than `b+a`.
- *Skeleton:*
  ```
  var strs = nums.Select(n => n.ToString()).ToArray();
  Array.Sort(strs, (a, b) => string.CompareOrdinal(b + a, a + b));   // descending
  var result = string.Concat(strs);
  return result[0] == '0' ? "0" : result;
  ```
  The `"0"` guard is essential — otherwise `[0,0]` produces `"00"`.

**E21.2**
- *Skeleton (sort):* sort descending; walk with `i` from 0; the h-index is the
  largest `i + 1` such that `citations[i] >= i + 1`. Stop at the first violation.
- *Linear rung:* citations above `n` are indistinguishable from `n` for this
  purpose, so bucket into `int[n + 1]` with everything `>= n` in the last bucket.
  Then walk from the top accumulating a running count until it reaches the index.

**E21.3**
- *Nudge:* After sorting, the closest pair must be **adjacent**.
- *Skeleton:* sort, one pass computing `nums[i] - nums[i-1]`; track the minimum
  and collect pairs, resetting the collection whenever you find a strictly smaller
  difference.
- *Overflow:* differences of two `int`s can exceed `int` range — compute in `long`
  if the constraints allow extreme values.

**E21.4**
- *Comparer approach:* build `int[26]` rank from `order` (characters absent get a
  rank that sorts them consistently, e.g. −1 or 26), then sort `s` by rank.
- *Counting approach (faster):* count `s`'s characters into `int[26]`; emit each
  character of `order` that many times; then emit every remaining character. O(n),
  no comparisons.

**E21.5**
- *Nudge:* Process cars from the one **closest to the target** backwards, and track
  arrival times.
- *Skeleton:*
  ```
  sort cars by position DESCENDING;
  time = (target - position) / (double)speed;
  // a car forms a NEW fleet if its time is strictly greater than the current lead time
  if (time > leadTime) { fleets++; leadTime = time; }
  ```
  A stack works too (push arrival times, pop when the incoming time is `<=` the
  top), but a single `leadTime` variable is the same logic in O(1) space.
- *Why:* if your arrival time is less than or equal to the car ahead's, you catch
  it and merge; you never pass it. Equal times at the target still merge.
