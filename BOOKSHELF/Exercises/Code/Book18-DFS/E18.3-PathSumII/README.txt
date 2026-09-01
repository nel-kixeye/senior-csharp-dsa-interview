Path Sum II

Return all root-to-leaf paths whose values sum to a target.

- Constraints: up to 5000 nodes; values may be negative.
- Target: O(n · height) time (the copying dominates).
- Edge cases: null root; a single node equal to the target; negative values
  meaning you cannot prune on "sum already exceeded"; a matching sum at an
  internal node (does not count — must be a leaf).


----
Guide: BOOKSHELF/Exercises/Book18-DFS.md  (hints at the bottom of that file)
