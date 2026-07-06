Given a sorted array and a target value, return the index where the target
would be inserted to keep the array sorted.
If target already exists, return its index.

Example: { 1, 3, 5, 6 }, target=5 -> 2
Example: { 1, 3, 5, 6 }, target=2 -> 1

Restrictions:
- Use binary search
- O(log n) time complexity
- Do not use LINQ