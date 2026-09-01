Rotting Oranges

A grid contains 0 (empty), 1 (fresh orange), 2 (rotten). Each minute, a
rotten orange rots every fresh orange adjacent to it (4-directionally).
Return the minutes until no fresh orange remains, or -1 if impossible.

- Constraints: grid up to 10 × 10.
- Target: O(rows · cols) time and space.
- Edge cases: no fresh oranges at start (answer 0); a fresh orange walled off
  by empty cells (answer −1); no rotten oranges but fresh ones exist (−1); empty
  grid.


----
Guide: BOOKSHELF/Exercises/Book05-Queue.md  (hints at the bottom of that file)
