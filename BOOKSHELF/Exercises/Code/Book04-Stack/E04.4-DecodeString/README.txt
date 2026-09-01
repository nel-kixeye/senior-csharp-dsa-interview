Decode String

Decode a string with the encoding k[encoded], meaning the bracketed content
repeats k times. Nesting is allowed.

Example: "3[a2[c]]" → "accaccacc".

- Constraints: k is a positive integer, possibly multi-digit; input is
  always valid.
- Target: O(output length) time.
- Edge cases: multi-digit counts ("12[a]"); nesting three deep; text
  outside brackets ("3[a]2[bc]"); no brackets at all.


----
Guide: BOOKSHELF/Exercises/Book04-Stack.md  (hints at the bottom of that file)
