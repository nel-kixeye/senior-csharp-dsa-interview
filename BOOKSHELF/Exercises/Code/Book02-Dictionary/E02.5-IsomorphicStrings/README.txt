Isomorphic Strings

Given two strings s and t, determine whether the characters of s can be
replaced to get t. Each character must map to exactly one character, and no two
characters may map to the same one. Order must be preserved.

Example: "egg" and "add" → true. "foo" and "bar" → false.

- Constraints: up to 5·10⁴ characters.
- Target: O(n) time, O(1) space (bounded alphabet).
- Edge cases: different lengths; "ab" vs "aa" (two chars mapping to one —
  must fail); identical strings.


----
Guide: BOOKSHELF/Exercises/Book02-Dictionary.md  (hints at the bottom of that file)
