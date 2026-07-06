Given an array of coin denominations and a total amount,
return the fewest number of coins needed to make up that amount.
Return -1 if the amount cannot be made.

Example: coins={1,5,11}, amount=15 -> 3 (three 5s)

Restrictions:
- Bottom-up dynamic programming
- O(amount * n) time complexity
- Do not use LINQ