Given a string s and a dictionary of strings wordDict,
return true if s can be segmented into a space-separated sequence
of one or more dictionary words.

Example: s="leetcode", wordDict={"leet","code"} -> true

Restrictions:
- Dynamic programming (bottom-up)
- O(n^2 * m) where m = average word length
- Do not use LINQ