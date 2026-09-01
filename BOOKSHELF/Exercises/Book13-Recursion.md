# Exercises — Book 13: Recursion

**Reach for it when:** the data is recursive, or the problem splits into
independent smaller instances.
**Three parts, in order:** base case → recurse on **strictly smaller** input →
combine.
**Trust the recursion.** Verify the base case and the combine step; do not
simulate the whole tree in your head.

---

### E13.1 — Maximum Depth of Binary Tree
Return the number of nodes along the longest root-to-leaf path.

- **Constraints:** up to 10⁴ nodes.
- **Target:** O(n) time, O(height) space.
- **Edge cases:** null root (0); single node (1); a completely one-sided tree.
- **Before you code:** state the recurrence in one sentence — "the depth of a node
  is ..." — before writing any code.
- *(Stub exists: `DSA/10-Trees`.)*

### E13.2 — Pow(x, n)
Compute `x` raised to the integer power `n`.

- **Constraints:** `-2^31 <= n <= 2^31 - 1`; `x` is a double.
- **Target:** **O(log n)** time — not O(n).
- **Edge cases:** `n = 0` (→ 1); **`n = int.MinValue`** (negating it overflows —
  this is the trap); `x = 0`; `x` negative with odd/even `n`.
- **Before you code:** name the identity that halves the exponent. Then say
  exactly how you will handle `int.MinValue` without calling `Math.Abs` on it.

### E13.3 — Merge Sort
Implement merge sort on an integer array.

- **Constraints:** up to 10⁵ elements. Do not call a library sort.
- **Target:** O(n log n) time, O(n) space, **stable**.
- **Edge cases:** empty; single element; already sorted; reverse sorted; all
  duplicates.
- **Before you code:** what makes merge sort stable, and which comparison operator
  in the merge step is responsible? (`<` vs `<=` — one of them breaks stability.)

### E13.4 — Nested List Weight Sum
Given a nested list of integers, return the sum of each integer multiplied by its
depth. The top level is depth 1.

Example: `[[1,1],2,[1,1]]` → `2·1 + 2·1 + 1·2 + 2·1 + 2·1 = 10`.

- **Constraints:** nesting up to 50 deep.
- **Target:** O(total elements) time, O(depth) space.
- **Edge cases:** empty list; a list containing only empty lists; a single
  integer; deeply nested with no integers at the top level.
- **Before you code:** what extra parameter does the recursive call need that the
  problem statement does not hand you?

### E13.5 — Lowest Common Ancestor of a Binary Tree
Given a binary tree and two nodes `p` and `q` (both guaranteed present), return
their lowest common ancestor. A node may be its own ancestor.

- **Constraints:** up to 10⁵ nodes. This is a **general** binary tree, not a BST.
- **Target:** O(n) time, O(height) space.
- **Edge cases:** `p` is an ancestor of `q`; `p == q`; one of them is the root;
  they are in different subtrees.
- **Before you code:** this has a strikingly short solution. What should a node
  return when it finds `p` in its left subtree and `q` in its right? What about
  when it finds only one of them?

---
---

# ⛔ STOP — hints below

---

**E13.1**
- *Skeleton:* `int Depth(TreeNode n) => n == null ? 0 : 1 + Math.Max(Depth(n.left), Depth(n.right));`
  Base case is `null → 0`, not `leaf → 1` — that handles one-sided nodes for free.

**E13.2**
- *Nudge:* `x^n = (x^(n/2))² `, times an extra `x` when `n` is odd.
- *Skeleton:*
  ```
  double Helper(double x, long n) {          // long, not int
      if (n == 0) return 1;
      var half = Helper(x, n / 2);
      return n % 2 == 0 ? half * half : half * half * x;
  }
  // caller: long e = n; if (e < 0) { x = 1 / x; e = -e; }
  ```
  Widening to `long` **before** negating is the fix for `int.MinValue` — its
  positive counterpart does not exist in `int`.

**E13.3**
- *Skeleton:* split at the midpoint, recurse on both halves, merge with two
  indices walking the sorted halves.
- *Stability:* in the merge, take from the **left** half when the values are
  equal — `if (left[i] <= right[j])`. Using `<` takes from the right on ties and
  breaks stability.
- *Base case:* length `<= 1` is already sorted.

**E13.4**
- *Nudge:* Depth is not in the data — you have to carry it down.
- *Skeleton:*
  ```
  int Sum(IList<NestedInteger> list, int depth) {
      int total = 0;
      foreach (var ni in list)
          total += ni.IsInteger() ? ni.GetInteger() * depth : Sum(ni.GetList(), depth + 1);
      return total;
  }
  // start with depth = 1
  ```

**E13.5**
- *Nudge:* Have each node report "did I find anything relevant below me?"
- *Skeleton:*
  ```
  TreeNode Lca(TreeNode node, TreeNode p, TreeNode q) {
      if (node == null || node == p || node == q) return node;
      var l = Lca(node.left, p, q);
      var r = Lca(node.right, p, q);
      if (l != null && r != null) return node;    // found one on each side -> this is it
      return l ?? r;                               // pass up whichever was found
  }
  ```
  The `node == p || node == q` base case is what makes "a node can be its own
  ancestor" work without a special branch.
