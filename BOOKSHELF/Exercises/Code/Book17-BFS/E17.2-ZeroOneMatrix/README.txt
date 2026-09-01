01 Matrix

Given a binary matrix, return a matrix where each cell holds its distance to the
nearest 0.

- Constraints: up to 10⁴ cells; at least one 0 is guaranteed.
- Target: O(rows · cols) time — a per-cell BFS would be O((rc)²).
- Edge cases: all zeroes; a single 1 surrounded by zeroes; a large block of
  1s; single row.


----
Guide: BOOKSHELF/Exercises/Book17-BFS.md  (hints at the bottom of that file)
