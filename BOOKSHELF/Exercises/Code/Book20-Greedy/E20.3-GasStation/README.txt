Gas Station

There are n stations in a circle with gas[i] fuel and cost[i] to reach the
next. Starting with an empty tank, return the index you must start at to complete
the circuit, or -1 if impossible. The answer is guaranteed unique if it exists.

- Constraints: up to 10⁵ stations.
- Target: O(n) time, O(1) space — one pass, no simulation from each start.
- Edge cases: total gas less than total cost (−1); single station; the answer
  is index 0; the answer is the last index.


----
Guide: BOOKSHELF/Exercises/Book20-Greedy.md  (hints at the bottom of that file)
