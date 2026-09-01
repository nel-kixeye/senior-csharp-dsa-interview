Remove K Digits

Given a numeric string, remove exactly k digits to produce the smallest possible
number. The result must have no leading zeroes (and "" becomes "0").

- Constraints: up to 10⁵ digits.
- Target: O(n) time.
- Edge cases: k equals the length (→ "0"); leading zeroes after removal
  ("10200", k=1 → "200"); already ascending digits (remove from the end);
  k = 0.


----
Guide: BOOKSHELF/Exercises/Book23-MonotonicStack.md  (hints at the bottom of that file)
