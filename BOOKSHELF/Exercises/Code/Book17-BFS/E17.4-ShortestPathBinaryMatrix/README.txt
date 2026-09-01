Shortest Path in Binary Matrix

In an n × n binary matrix, find the length of the shortest clear path from the
top-left to the bottom-right, moving 8-directionally through 0 cells. Return
-1 if none exists.

- Constraints: n up to 100.
- Target: O(n²) time.
- Edge cases: start or end cell is 1 (return −1 immediately); n = 1;
  fully blocked; the whole grid is clear.


----
Guide: BOOKSHELF/Exercises/Book17-BFS.md  (hints at the bottom of that file)
