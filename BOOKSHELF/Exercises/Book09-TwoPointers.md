# Exercises — Book 09: Two Pointers

**Reach for it when:** sorted data + pair search; both ends inward; in-place
filtering; O(1) space on an array.
**Three shapes:** converging (`lo`/`hi`), read/write (in-place), and two-sequence
(merge/subsequence).

---

### E09.1 — Valid Palindrome
Determine whether a string is a palindrome, considering only alphanumeric
characters and ignoring case.

- **Constraints:** up to 2·10⁵ characters; may contain punctuation and spaces.
- **Target:** O(n) time, **O(1) space** — do not build a cleaned copy.
- **Edge cases:** empty string (true); all non-alphanumeric (true); single
  character; mixed case.
- **Before you code:** the easy version allocates a filtered string first. Do it
  without that — what do the pointers do when they land on punctuation?

### E09.2 — Two Sum II (Input Sorted)
Given a **1-indexed sorted** array and a target, return the indices of the two
values summing to the target. Exactly one solution exists.

- **Constraints:** up to 3·10⁴ elements. **O(1) extra space required.**
- **Target:** O(n) time, O(1) space.
- **Edge cases:** two elements only; negatives; the answer uses the first and
  last elements; duplicates.
- **Before you code:** when the current sum is too small, which pointer moves,
  and *why is it safe* to discard everything that pointer skipped past?

### E09.3 — 3Sum
Return all **unique** triplets that sum to zero.

- **Constraints:** up to 3000 elements; the result must contain no duplicate
  triplets.
- **Target:** O(n²) time, O(1) extra space beyond the output.
- **Edge cases:** all zeroes (`[0,0,0,0]` → one triplet); fewer than 3 elements;
  no valid triplet; many duplicates.
- **Before you code:** sorting does **two** jobs here. Name both. (Most people
  name only the first, and then produce duplicate triplets.)

### E09.4 — Container With Most Water
Given heights of vertical lines, find two lines that with the x-axis form the
container holding the most water.

- **Constraints:** up to 10⁵ heights.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** two lines; all equal heights; strictly increasing heights; a
  zero height.
- **Before you code:** start wide. When you move a pointer inward the width
  always shrinks, so you must move the one that *could* let height grow. Which
  one, and why is discarding the other safe?

### E09.5 — Sort Colors (Dutch National Flag)
Sort an array containing only `0`, `1`, `2` in place, without using a library
sort.

- **Constraints:** up to 300 elements. **One pass, O(1) space.**
- **Target:** O(n) time, O(1) space, single pass.
- **Edge cases:** already sorted; reverse sorted; all one value; a single
  element; missing values entirely.
- **Before you code:** counting sort solves this in two passes. The one-pass
  version needs **three** pointers. Name each one's job — and say why the loop
  index must *not* advance in one particular case.

---
---

# ⛔ STOP — hints below

---

**E09.1**
- *Nudge:* Skip, do not filter.
- *Structure:* `i` from the left, `j` from the right, plus inner skip loops.
- *Skeleton:*
  ```
  while (i < j) {
      while (i < j && !char.IsLetterOrDigit(s[i])) i++;
      while (i < j && !char.IsLetterOrDigit(s[j])) j--;
      if (char.ToLowerInvariant(s[i]) != char.ToLowerInvariant(s[j])) return false;
      i++; j--;
  }
  ```
  The `i < j` guard inside the skip loops matters — without it you can run off
  the end on an all-punctuation string.

**E09.2**
- *Nudge:* Sum too small → you need a bigger number → the only bigger numbers are
  to the right of `lo`.
- *Skeleton:* `if (sum < target) lo++; else if (sum > target) hi--; else return ...;`
- *Why it is safe:* if `nums[lo] + nums[hi]` is too small, then `nums[lo]` paired
  with anything **≤ nums[hi]** is also too small — so `lo` can never be part of a
  solution with any remaining partner. One step eliminates a whole row.

**E09.3**
- *Nudge:* Fix one element, two-point the rest.
- *Structure:* sort, then for each `i`, converge `lo = i+1`, `hi = n-1`.
- *Skeleton:* skip duplicates in **three** places — at `i` (`if (i > 0 && nums[i] == nums[i-1]) continue;`)
  and after recording a hit, advance `lo` past equal values and `hi` back past
  equal values.
- *Sorting's two jobs:* it enables the converging scan, **and** it makes
  duplicates adjacent so they can be skipped. That second job is the one people
  miss.

**E09.4**
- *Nudge:* Area is limited by the **shorter** wall.
- *Skeleton:* `area = (hi - lo) * Math.Min(h[lo], h[hi]);` then move whichever
  side is shorter inward.
- *Why it is safe:* keeping the shorter wall and shrinking the width can never
  increase the area — every container involving that shorter wall is already no
  better than the one you just measured.

**E09.5**
- *Nudge:* Partition into three regions as you sweep.
- *Structure:* `low` (boundary of the 0s), `mid` (the scanner), `high` (boundary
  of the 2s).
- *Skeleton:*
  ```
  while (mid <= high) {
      if      (nums[mid] == 0) { swap(low++, mid++); }
      else if (nums[mid] == 1) { mid++; }
      else                     { swap(mid, high--); }   // do NOT advance mid
  }
  ```
  `mid` must not advance in the `2` case: the value swapped in from `high` is
  unexamined and could itself be a 0 or 2.
