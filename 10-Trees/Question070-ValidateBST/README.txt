Given the root of a binary tree, determine if it is a valid Binary Search Tree (BST).

A valid BST:
- Left subtree of a node contains only nodes with keys LESS THAN the node's key
- Right subtree contains only nodes with keys GREATER THAN the node's key
- Both subtrees are also valid BSTs

Restrictions:
- O(n) time complexity
- Consider using min/max bounds rather than only comparing adjacent nodes
- Do not use LINQ