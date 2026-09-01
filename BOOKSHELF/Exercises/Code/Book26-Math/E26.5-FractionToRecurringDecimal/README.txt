Fraction to Recurring Decimal

Given a numerator and denominator, return the fraction as a string. If the
fractional part repeats, wrap the repeating portion in parentheses.

Example: 1/2 → "0.5", 2/3 → "0.(6)", 4/333 → "0.(012)".

- Constraints: both fit in 32-bit signed; the denominator may be negative.
- Edge cases: numerator = int.MinValue (negation overflows — use long);
  denominator negative; exact division (no decimal point at all); result is
  negative; numerator 0.


----
Guide: BOOKSHELF/Exercises/Book26-Math.md  (hints at the bottom of that file)
