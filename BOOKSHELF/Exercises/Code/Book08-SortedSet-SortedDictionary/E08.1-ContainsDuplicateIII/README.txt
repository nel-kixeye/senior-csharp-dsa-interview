Contains Duplicate III

Given an array, determine whether there exist two indices i and j such that
|i - j| <= indexDiff and |nums[i] - nums[j]| <= valueDiff.

- Constraints: up to 10⁵ elements; values may be large enough to overflow
  int on subtraction.
- Target: O(n log k) time, O(k) space where k = indexDiff.
- Edge cases: valueDiff = 0 (exact duplicates only); indexDiff = 0
  (impossible); negative values; overflow on nums[i] - nums[j].


----
Guide: BOOKSHELF/Exercises/Book08-SortedSet-SortedDictionary.md  (hints at the bottom of that file)
