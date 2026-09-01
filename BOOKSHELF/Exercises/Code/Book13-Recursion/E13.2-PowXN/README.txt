Pow(x, n)

Compute x raised to the integer power n.

- Constraints: -2^31 <= n <= 2^31 - 1; x is a double.
- Target: O(log n) time — not O(n).
- Edge cases: n = 0 (→ 1); n = int.MinValue (negating it overflows —
  this is the trap); x = 0; x negative with odd/even n.


----
Guide: BOOKSHELF/Exercises/Book13-Recursion.md  (hints at the bottom of that file)
