Merge Intervals

Given a collection of intervals, merge all overlapping ones and return the
non-overlapping result.

- Constraints: up to 10⁴ intervals; input is not sorted.
- Target: O(n log n) time, O(n) space.
- Edge cases: one interval fully contained in another (the classic bug);
  touching intervals [1,4] and [4,5] (merge); no overlaps at all; identical
  intervals.


----
Guide: BOOKSHELF/Exercises/Book22-Intervals.md  (hints at the bottom of that file)
