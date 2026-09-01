Given two strings text1 and text2, return the length of their
Longest Common Subsequence (LCS).
A subsequence is a sequence derived by deleting some characters without changing order.
If there is no common subsequence, return 0.

Example: text1="abcde", text2="ace" -> 3  (LCS is "ace")

Restrictions:
- 2D dynamic programming table
- O(m * n) time and space
- Do not use LINQ