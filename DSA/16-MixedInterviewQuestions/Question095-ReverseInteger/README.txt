Given a signed 32-bit integer x, reverse its digits.
Return 0 if the reversed integer would overflow the 32-bit signed integer range.

Example: x=123 -> 321
Example: x=-123 -> -321
Example: x=120 -> 21

Restrictions:
- Do not convert to string
- Handle overflow (int.MinValue / int.MaxValue bounds)
- O(log n) time