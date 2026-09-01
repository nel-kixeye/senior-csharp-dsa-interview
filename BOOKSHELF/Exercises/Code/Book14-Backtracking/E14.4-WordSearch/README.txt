Word Search

Given an m × n grid of characters and a word, return whether the word exists as
a path of horizontally or vertically adjacent cells. A cell may not be reused
within a single word.

- Constraints: grid up to 6 × 6; word up to 15 characters.
- Target: O(m · n · 4^L) worst case.
- Edge cases: word longer than the grid; single-character word; the word
  requires revisiting a cell (must fail); word not present at all.


----
Guide: BOOKSHELF/Exercises/Book14-Backtracking.md  (hints at the bottom of that file)
