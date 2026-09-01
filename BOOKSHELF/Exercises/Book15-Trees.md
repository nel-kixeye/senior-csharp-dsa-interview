# Exercises — Book 15: Trees

**Reach for it when:** hierarchy, nesting, parent/child.
**Pick the traversal by what you need:** inorder for *sorted BST order*,
postorder for *computing from children*, preorder for *copy/serialize*, level
order for *by depth*.

---

### E15.1 — Invert Binary Tree
Swap every node's left and right children, and return the root.

- **Constraints:** up to 100 nodes.
- **Target:** O(n) time, O(height) space.
- **Edge cases:** null root; single node; already symmetric.
- **Before you code:** does the order of "swap" versus "recurse" matter here?
  Answer yes or no and say why — it is a good test of whether you understand
  traversal order.

### E15.2 — Validate Binary Search Tree
Determine whether a binary tree is a valid BST (every node in the left subtree is
strictly smaller, every node in the right strictly larger).

- **Constraints:** up to 10⁴ nodes; values can be `int.MinValue` and
  `int.MaxValue`.
- **Target:** O(n) time, O(height) space.
- **Edge cases:** single node (valid); duplicates (invalid); a node deep in the
  left subtree that is larger than the **root** but smaller than its parent — this
  is the case that breaks the naive solution; extreme int values as node data.
- **Before you code:** the obvious approach compares each node to its parent. Give
  a concrete 3-node-or-larger tree where that returns the wrong answer.

### E15.3 — Diameter of Binary Tree
Return the length (in **edges**) of the longest path between any two nodes. The
path need not pass through the root.

- **Constraints:** up to 10⁴ nodes.
- **Target:** O(n) time — not O(n²).
- **Edge cases:** single node (0); a path not through the root; a completely
  one-sided tree.
- **Before you code:** the naive version computes the height at every node,
  which is O(n²). What can a single postorder pass return that gives you both the
  height *and* lets you update the answer?

### E15.4 — Kth Smallest Element in a BST
Return the kth smallest value in a BST (1-indexed).

- **Constraints:** up to 10⁴ nodes; `1 <= k <= n`.
- **Target:** O(height + k) time — you should not visit all n nodes.
- **Edge cases:** `k = 1` (leftmost); `k = n` (rightmost); a right-skewed tree.
- **Before you code:** which traversal visits a BST's values in sorted order? Then:
  how do you **stop early** at the kth, rather than collecting all n first?

### E15.5 — Serialize and Deserialize Binary Tree
Encode a binary tree to a string and decode it back. The tree may contain any
integer values, and is not a BST.

- **Constraints:** up to 10⁴ nodes; values may be negative.
- **Edge cases:** null root; single node; one-sided tree; negative values;
  multi-digit values (your delimiter must handle them).
- **Before you code:** why is preorder alone enough for round-tripping here, when
  preorder alone is *not* enough to reconstruct a tree in general? What do you
  have to include to make it work?

---
---

# ⛔ STOP — hints below

---

**E15.1**
- *Skeleton:*
  ```
  TreeNode Invert(TreeNode n) {
      if (n == null) return null;
      (n.left, n.right) = (Invert(n.right), Invert(n.left));
      return n;
  }
  ```
- *Answer to the prompt:* no, order does not matter — every node gets swapped
  exactly once either way. (Contrast with problems where a node's result depends
  on its children's results — there, order is everything.)

**E15.2**
- *Nudge:* Pass an allowed range down, narrowing it at each step.
- *Skeleton:*
  ```
  bool Valid(TreeNode n, long lo, long hi)
      => n == null || (lo < n.val && n.val < hi
                       && Valid(n.left, lo, n.val) && Valid(n.right, n.val, hi));
  // start: Valid(root, long.MinValue, long.MaxValue)
  ```
  Use `long` bounds so a node holding `int.MinValue` does not falsely fail.
- *The counterexample:* root 5, left child 1, and 1's **right** child 6. Every
  parent comparison passes; 6 is in the left subtree of 5 and larger than it, so
  the tree is invalid.

**E15.3**
- *Nudge:* Compute height once per node, and update a running best on the way up.
- *Skeleton:*
  ```
  int best = 0;
  int Height(TreeNode n) {
      if (n == null) return 0;
      int l = Height(n.left), r = Height(n.right);
      best = Math.Max(best, l + r);        // path through this node, in edges
      return 1 + Math.Max(l, r);
  }
  ```
  One postorder pass, O(n). The `l + r` is the diameter through `n`; the return
  value is what `n`'s parent needs.

**E15.4**
- *Nudge:* Inorder on a BST is sorted. Count as you go and stop.
- *Skeleton (iterative, stops early):*
  ```
  var st = new Stack<TreeNode>(); var cur = root;
  while (cur != null || st.Count > 0) {
      while (cur != null) { st.Push(cur); cur = cur.left; }
      cur = st.Pop();
      if (--k == 0) return cur.val;
      cur = cur.right;
  }
  ```
  The iterative form is what makes early exit natural — a recursive version needs
  a flag or an exception to stop.

**E15.5**
- *Nudge:* Record the nulls.
- *Skeleton:* serialize with preorder, emitting a sentinel (e.g. `"#"`) for every
  null child, comma-delimited. Deserialize by consuming tokens in the same order:
  read a token; if it is the sentinel return null; otherwise build the node and
  recursively fill left then right.
- *Why it works:* preorder alone is ambiguous because you cannot tell where a
  subtree ends. Emitting explicit null markers removes that ambiguity — the
  structure is fully encoded.
