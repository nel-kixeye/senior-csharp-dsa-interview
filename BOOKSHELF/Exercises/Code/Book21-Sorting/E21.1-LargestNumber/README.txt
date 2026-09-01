Largest Number

Given non-negative integers, arrange them to form the largest possible number.
Return it as a string.

Example: [3, 30, 34, 5, 9] → "9534330".

- Constraints: up to 100 numbers, each up to 10⁹.
- Target: O(n log n · L).
- Edge cases: all zeroes ([0, 0] must give "0", not "00"); single
  number; numbers where one is a prefix of another ([3, 30]).


----
Guide: BOOKSHELF/Exercises/Book21-Sorting.md  (hints at the bottom of that file)
