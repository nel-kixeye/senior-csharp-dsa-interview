House Robber

Given house values along a street, maximize the total you can take without
robbing two adjacent houses.

- Constraints: up to 100 houses; values 0–400.
- Target: O(n) time, O(1) space.
- Edge cases: single house; two houses (take the larger); all zeroes; the
  optimal choice skips two in a row.
- Follow-up: House Robber II — the houses are in a circle, so the first and
  last are adjacent. Solve it by calling your existing function twice. On what
  two ranges?


----
Guide: BOOKSHELF/Exercises/Book19-DynamicProgramming.md  (hints at the bottom of that file)
