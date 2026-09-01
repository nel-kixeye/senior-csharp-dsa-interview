Run-Length Encoding

Encode a string so "aaabbc" becomes "a3b2c1". Then write the decoder.

- Constraints: input up to 10⁵ lowercase characters; run lengths may exceed 9.
- Target: O(n) time, one pass each way.
- Edge cases: empty string; a single character; no repeats at all (output is
  longer than input); runs of 10+ (multi-digit counts); the decoder meeting a
  multi-digit count.


----
Guide: BOOKSHELF/Exercises/Book30-StringBuilder.md  (hints at the bottom of that file)
