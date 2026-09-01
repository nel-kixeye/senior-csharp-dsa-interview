Coin Change

Given coin denominations and an amount, return the fewest coins summing to it,
or -1 if impossible.

- Constraints: up to 12 denominations; amount up to 10⁴; denominations are
  arbitrary.
- Target: O(amount · coins) time, O(amount) space.
- Edge cases: amount 0 (→ 0); no combination possible; a coin larger than the
  amount; verify greedy fails on coins = [1,3,4], amount = 6.
- Watch: the "impossible" sentinel — do not add 1 to int.MaxValue.


----
Guide: BOOKSHELF/Exercises/Book19-DynamicProgramming.md  (hints at the bottom of that file)
