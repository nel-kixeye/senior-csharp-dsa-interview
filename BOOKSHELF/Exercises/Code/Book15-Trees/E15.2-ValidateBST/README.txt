Validate Binary Search Tree

Determine whether a binary tree is a valid BST (every node in the left subtree is
strictly smaller, every node in the right strictly larger).

- Constraints: up to 10⁴ nodes; values can be int.MinValue and
  int.MaxValue.
- Target: O(n) time, O(height) space.
- Edge cases: single node (valid); duplicates (invalid); a node deep in the
  left subtree that is larger than the root but smaller than its parent — this
  is the case that breaks the naive solution; extreme int values as node data.


----
Guide: BOOKSHELF/Exercises/Book15-Trees.md  (hints at the bottom of that file)
