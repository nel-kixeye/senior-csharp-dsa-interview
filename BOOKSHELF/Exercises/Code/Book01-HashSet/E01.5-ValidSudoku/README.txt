Valid Sudoku

Given a 9×9 board (digits 1–9 or .), determine whether it is valid: no
duplicate digit in any row, column, or 3×3 sub-box. The board need not be
solvable.

- Constraints: fixed 9×9.
- Target: O(1) — the board is fixed size — but structure it as one pass.
- Edge cases: fully empty board (valid); duplicate only within a sub-box but
  not in its row or column.


----
Guide: BOOKSHELF/Exercises/Book01-HashSet.md  (hints at the bottom of that file)
