# Exercises — Book 12: Binary Search

**Reach for it when:** you can eliminate half the candidates — *not only* when
the array is sorted.
**Use one template:** `while (lo < hi)`, `hi = mid` on true, `lo = mid + 1` on
false, return `lo`. It cannot infinite-loop.
**Always:** `mid = lo + (hi - lo) / 2`.

---

### E12.1 — Search Insert Position
Given a sorted array of distinct values and a target, return its index, or the
index where it would be inserted to keep the array sorted.

- **Constraints:** up to 10⁴ elements. **O(log n) required.**
- **Target:** O(log n) time, O(1) space.
- **Edge cases:** target smaller than everything (0); larger than everything
  (`n`); exact match at either end; single element.
- **Before you code:** write the lower-bound template from memory, then apply it.
  This exercise is about the template, not the problem.

### E12.2 — Find First and Last Position of Element in Sorted Array
Given a sorted array with possible duplicates and a target, return the first and
last indices of the target, or `[-1, -1]`.

- **Constraints:** up to 10⁵ elements. **O(log n) required.**
- **Target:** O(log n) time, O(1) space.
- **Edge cases:** target absent; a single occurrence; the entire array is the
  target; target at index 0 or `n-1`.
- **Before you code:** `Array.BinarySearch` does **not** promise the first match.
  So: two searches with two different predicates. Name both predicates.

### E12.3 — Search in Rotated Sorted Array
A sorted array of distinct values was rotated at an unknown pivot. Find a target's
index, or `-1`.

Example: `[4,5,6,7,0,1,2]`, target `0` → `4`.

- **Constraints:** up to 5000 elements. **O(log n) required.**
- **Target:** O(log n) time, O(1) space.
- **Edge cases:** not rotated at all; rotated by 1; target is the pivot element;
  single element; target absent.
- **Before you code:** at any `mid`, **one of the two halves is guaranteed
  sorted**. How do you tell which, and what do you do with that fact?

### E12.4 — Koko Eating Bananas
Piles of bananas and `h` hours. At an eating speed of `k` bananas/hour, each pile
takes `ceil(pile / k)` hours (Koko never eats from two piles in the same hour).
Return the **minimum** `k` that finishes within `h` hours.

- **Constraints:** up to 10⁴ piles; pile sizes up to 10⁹; `h >= piles.Length`.
- **Target:** O(n log(max pile)) time.
- **Edge cases:** `h == piles.Length` (must eat the biggest pile in one hour);
  one pile; all piles equal; huge pile values.
- **Before you code:** you are not searching the array — you are searching the
  **answer space**. State the monotone property: *if speed k works, then...*
  Complete that sentence, and give the `lo` and `hi` bounds.

### E12.5 — Split Array Largest Sum
Split an array into `k` non-empty contiguous subarrays so as to **minimize the
largest subarray sum**. Return that minimized largest sum.

- **Constraints:** up to 1000 elements, values up to 10⁶; `1 <= k <= n`.
- **Target:** O(n log(sum)) time.
- **Edge cases:** `k = 1` (answer is the total); `k = n` (answer is the max
  element); all equal values.
- **Before you code:** "minimize the maximum" is a phrase that should trigger this
  book instantly. What is the feasibility check — given a candidate largest-sum
  `X`, how do you test whether `k` pieces suffice?

---
---

# ⛔ STOP — hints below

---

**E12.1**
- *Skeleton:*
  ```
  int lo = 0, hi = nums.Length;                 // hi EXCLUSIVE
  while (lo < hi) {
      int mid = lo + (hi - lo) / 2;
      if (nums[mid] >= target) hi = mid; else lo = mid + 1;
  }
  return lo;
  ```
  This is the lower bound, and it is also the insert position. Same code.

**E12.2**
- *Nudge:* First occurrence is the lower bound; last is the upper bound minus one.
- *Skeleton:* run the template with predicate `nums[mid] >= target` → `first`.
  Run it again with `nums[mid] > target` → `last = result - 1`. Then verify
  `first < n && nums[first] == target`, else return `[-1,-1]`.

**E12.3**
- *Nudge:* Compare `nums[lo]` with `nums[mid]` to find which half is sorted.
- *Skeleton:*
  ```
  if (nums[lo] <= nums[mid]) {                        // left half sorted
      if (target >= nums[lo] && target < nums[mid]) hi = mid - 1; else lo = mid + 1;
  } else {                                            // right half sorted
      if (target > nums[mid] && target <= nums[hi]) lo = mid + 1; else hi = mid - 1;
  }
  ```
  Use the inclusive `lo <= hi` form here with an early `return mid` on a match —
  the rotated case is one of the few where that form reads more clearly.

**E12.4**
- *Nudge:* If speed `k` finishes in time, so does every speed above `k`. Monotone
  → binary-searchable boundary.
- *Skeleton:* `lo = 1`, `hi = piles.Max()`. Predicate: `HoursNeeded(mid) <= h`,
  where `HoursNeeded(k) = piles.Sum(p => (p + k - 1) / k)` — integer ceiling
  division. Apply the lower-bound template; the answer is `lo`.
- *Watch:* sum the hours in `long`.

**E12.5**
- *Nudge:* Guess the answer, then check feasibility greedily.
- *Skeleton:* `lo = nums.Max()`, `hi = nums.Sum()`. Feasibility for candidate `X`:
  sweep the array accumulating; whenever adding the next element would exceed
  `X`, start a new piece. Feasible iff `pieces <= k`.
- *Why those bounds:* `lo` must be at least the largest element (it has to fit in
  some piece), and `hi` is the whole array as one piece. The answer is always in
  `[lo, hi]`.
