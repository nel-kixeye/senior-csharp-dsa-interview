String to Integer (atoi)

Parse a leading integer from a string: skip leading whitespace, accept an optional
sign, read digits until a non-digit, and clamp to int range.

- Constraints: the string may be arbitrary.
- Edge cases: this problem is its edge cases — leading/trailing spaces;
  "+-12" (invalid, → 0); "words 123" (→ 0); "  -042" (→ −42);
  "91283472332" (clamp to int.MaxValue); "-91283472332" (clamp to
  int.MinValue); empty string; "+" alone.
- Production note: afterwards, say which BCL call you would actually use.


----
Guide: BOOKSHELF/Exercises/Book24-Strings.md  (hints at the bottom of that file)
