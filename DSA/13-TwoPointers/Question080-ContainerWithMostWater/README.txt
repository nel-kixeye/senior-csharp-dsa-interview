Given an array of non-negative integers representing the height of walls,
find two lines that together with the x-axis form a container that holds the most water.

Example: { 1,8,6,2,5,4,8,3,7 } -> 49

Restrictions:
- Two-pointer approach (start from both ends, move the shorter side inward)
- O(n) time, O(1) space
- Do not use LINQ