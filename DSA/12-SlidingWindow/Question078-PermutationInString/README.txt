Given two strings s1 and s2, return true if s2 contains a permutation of s1.
In other words, does any substring of s2 have the same character frequencies as s1?

Example: s1="ab", s2="eidbaooo" -> true  (substring "ba")

Restrictions:
- Sliding window with a fixed-size window equal to len(s1)
- Do not use LINQ or Array.Sort()
- O(n) time complexity