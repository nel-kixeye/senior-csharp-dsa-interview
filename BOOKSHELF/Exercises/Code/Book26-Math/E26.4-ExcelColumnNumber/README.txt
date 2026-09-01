Excel Sheet Column Number

Convert an Excel column title to its number. "A" → 1, "Z" → 26, "AA" → 27,
"AB" → 28.

- Constraints: up to 7 characters, uppercase.
- Target: O(n) time, O(1) space.
- Edge cases: "A"; "Z"; "AA"; "FXSHRXW" (int.MaxValue — watch the
  accumulator); lowercase input if you want to be defensive.
- Follow-up: write the inverse (number → title). The off-by-one bites harder
  going backwards — say where.


----
Guide: BOOKSHELF/Exercises/Book26-Math.md  (hints at the bottom of that file)
