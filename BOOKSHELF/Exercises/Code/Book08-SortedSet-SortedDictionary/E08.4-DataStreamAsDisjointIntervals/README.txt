Data Stream as Disjoint Intervals

Implement AddNum(int) and GetIntervals(), which returns the stream's values
so far summarized as a sorted list of disjoint intervals.

- Constraints: up to 3·10⁴ calls; values may repeat.
- Target: O(log n) per add.
- Edge cases: a value that merges two existing intervals into one; a
  duplicate value; a value extending an interval at either end; the first value.


----
Guide: BOOKSHELF/Exercises/Book08-SortedSet-SortedDictionary.md  (hints at the bottom of that file)
