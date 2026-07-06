A happy number is defined by the following process:
Starting with any positive integer, replace the number by the
sum of the squares of its digits.
Repeat until the number equals 1 (happy), or it loops endlessly (not happy).

Example: 19 -> 1^2 + 9^2 = 82 -> 8^2 + 2^2 = 68 -> ... -> 1

Restrictions:
- Do not use LINQ
- Use a hash set to detect cycles