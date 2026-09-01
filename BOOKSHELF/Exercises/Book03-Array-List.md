# Exercises — Book 03: Array / List

**Reach for it when:** position carries meaning; indexed access; in-place work.
**Watch:** `Insert(0,x)`, `RemoveAt(0)`, and `Contains` are all O(n).

---

### E03.1 — Move Zeroes
Move all zeroes in an integer array to the end **in place**, preserving the
relative order of the non-zero elements.

- **Constraints:** up to 10⁴ elements. Must be done in place; minimize writes.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** all zeroes; no zeroes; single element; zeroes already at the
  end.
- **Before you code:** you need two indices with different jobs. Name each one's
  job before writing the loop.
- *(Stub exists: `DSA/01-Arrays/Question004-MoveZeroes`.)*

### E03.2 — Rotate Array
Rotate an integer array to the right by `k` steps, in place.

Example: `[1,2,3,4,5,6,7]`, `k = 3` → `[5,6,7,1,2,3,4]`.

- **Constraints:** up to 10⁵ elements; `k` may exceed the array length.
- **Target:** O(n) time, **O(1) space**.
- **Edge cases:** `k = 0`; `k` equal to the length; `k` much larger than the
  length; single element.
- **Before you code:** the O(n)-space version is easy. The O(1) version uses one
  operation applied three times — what operation?
- *(Stub exists: `DSA/01-Arrays/Question002-RotateArray`.)*

### E03.3 — Product of Array Except Self
Return an array where `output[i]` is the product of every element except
`nums[i]`.

- **Constraints:** up to 10⁵ elements. **Division is not allowed.** Must run in
  O(n).
- **Target:** O(n) time, O(1) extra space (the output array does not count).
- **Edge cases:** contains one zero; contains two zeroes; contains negatives;
  length 2.
- **Before you code:** for any position, the answer is (everything left of it) ×
  (everything right of it). How many passes does that need, and what do you carry
  between them?

### E03.4 — Merge Sorted Array
You are given `nums1` of length `m + n` (the first `m` entries are values, the
rest are 0 padding) and `nums2` of length `n`. Merge `nums2` into `nums1` in
sorted order, **in place**.

- **Constraints:** both inputs already sorted ascending.
- **Target:** O(m + n) time, O(1) space.
- **Edge cases:** `m = 0`; `n = 0`; all of `nums2` smaller than all of `nums1`;
  duplicates across both.
- **Before you code:** filling from the **front** overwrites values you still
  need. Which end should you fill from, and why does that fix it?
- *(Stub exists: `DSA/01-Arrays/Question005-MergeSortedArrays`.)*

### E03.5 — Spiral Matrix
Given an `m × n` matrix, return all its elements in spiral order (right along the
top, down the right side, left along the bottom, up the left side, inward).

- **Constraints:** up to 10 × 10; elements may be negative.
- **Target:** O(m · n) time, O(1) extra space.
- **Edge cases:** single row; single column; 1×1; non-square; even vs odd
  dimensions (the final centre row/column is where off-by-ones live).
- **Before you code:** you are tracking four moving boundaries. Name them, and
  say when each one shrinks.

---
---

# ⛔ STOP — hints below

---

**E03.1**
- *Nudge:* One pointer reads every element; the other marks where the next
  non-zero belongs.
- *Structure:* `read` and `write` indices, `write <= read` always.
- *Skeleton:* `if (nums[read] != 0) nums[write++] = nums[read];` then zero-fill
  from `write` to the end. (Book 09's read/write shape.)

**E03.2**
- *Nudge:* Reverse.
- *Structure:* Three reversals, no extra array.
- *Skeleton:* `k %= n;` then reverse the whole array, reverse `[0, k)`, reverse
  `[k, n)`. The `k %= n` is not optional — `k` can exceed the length.

**E03.3**
- *Nudge:* Two passes, one from each direction.
- *Structure:* Build prefix products into the output array; then walk backwards
  multiplying by a running suffix product held in a single variable.
- *Skeleton:*
  ```
  out[0] = 1; for i in 1..n-1: out[i] = out[i-1] * nums[i-1];
  int suffix = 1; for i = n-1 down to 0: out[i] *= suffix; suffix *= nums[i];
  ```

**E03.4**
- *Nudge:* The padding is at the end. That is a gift.
- *Structure:* Three indices: `i = m-1`, `j = n-1`, `write = m+n-1`.
- *Skeleton:* compare `nums1[i]` and `nums2[j]`, write the **larger** to
  `nums1[write--]`. Afterwards, only leftover `nums2` needs draining — leftover
  `nums1` is already in place.

**E03.5**
- *Nudge:* Four boundaries that close in.
- *Structure:* `top, bottom, left, right`.
- *Skeleton:* walk right along `top` then `top++`; down `right` then `right--`;
  left along `bottom` then `bottom--`; up `left` then `left++`. Loop while
  `top <= bottom && left <= right`, and **re-check those conditions before the
  third and fourth walks** — that is where single-row and single-column inputs
  break.
