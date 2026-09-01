Nested List Weight Sum

Given a nested list of integers, return the sum of each integer multiplied by its
depth. The top level is depth 1.

Example: [[1,1],2,[1,1]] → 2·1 + 2·1 + 1·2 + 2·1 + 2·1 = 10.

- Constraints: nesting up to 50 deep.
- Target: O(total elements) time, O(depth) space.
- Edge cases: empty list; a list containing only empty lists; a single
  integer; deeply nested with no integers at the top level.


----
Guide: BOOKSHELF/Exercises/Book13-Recursion.md  (hints at the bottom of that file)
