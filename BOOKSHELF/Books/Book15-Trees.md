# Book 15 — Trees

> The book of *"hierarchy."*

## 1. What problem does this book solve?

Representing and querying **hierarchical** relationships: each node has one
parent and any number of children, with no cycles. Trees are the data structure
where recursion stops being a technique and becomes the natural way to write the
code.

## 2. Signals

- "Parent / child / ancestor / descendant / sibling"
- "Hierarchy" / "org chart" / "file system" / "category tree"
- "Root" / "leaf" / "depth" / "height" / "level"
- "Binary tree" / "BST" / "n-ary tree"
- "Nested" structures — JSON, XML, DOM, expression trees
- "Traverse" / "visit every node"
- **Sorted + tree** → BST, and inorder traversal yields sorted order
- "Lowest common ancestor"
- "Path from root to ..."

**The BST tell:** if the problem says binary *search* tree, the answer almost
always uses the ordering property to skip a subtree — otherwise why mention it?

## 3. The naive instinct

Flattening the tree into a list, then working with indices. Or writing an
explicit stack for a traversal that recursion expresses in three lines.

The subtler naive instinct: on a **BST**, searching both subtrees when the
ordering tells you which one to skip — throwing away O(log n) for O(n).

## 4. Why that matters

For a BST, `if (target < node.val) go left else go right` is the entire point of
the structure. Searching both sides is not slower by a constant, it is
asymptotically wrong: O(n) instead of O(log n).

For general trees, flattening loses the structure the problem is about, and
usually costs O(n) memory to answer a question recursion answers in O(height).

## 5. What to recognize

**The four traversals.** The difference is *when you touch the node* relative to
recursing:

```csharp
void PreOrder(TreeNode n)   // node, left, right  — copy/serialize a tree
{ if (n == null) return; Visit(n); PreOrder(n.left); PreOrder(n.right); }

void InOrder(TreeNode n)    // left, node, right  — SORTED for a BST
{ if (n == null) return; InOrder(n.left); Visit(n); InOrder(n.right); }

void PostOrder(TreeNode n)  // left, right, node  — delete, or compute from children
{ if (n == null) return; PostOrder(n.left); PostOrder(n.right); Visit(n); }
```

**Level order** is not a recursion — it is BFS with a queue (05, 17):

```csharp
var q = new Queue<TreeNode>();
if (root != null) q.Enqueue(root);
while (q.Count > 0)
{
    int levelSize = q.Count;                    // freeze the level
    var level = new List<int>();
    for (int i = 0; i < levelSize; i++)
    {
        var n = q.Dequeue();
        level.Add(n.val);
        if (n.left != null) q.Enqueue(n.left);
        if (n.right != null) q.Enqueue(n.right);
    }
    result.Add(level);
}
```

**Choosing a traversal by what you need:**

| Need | Traversal |
|---|---|
| Values in sorted order (BST) | **Inorder** |
| Copy / serialize / print structure | Preorder |
| Compute a value from children (height, sum, delete) | **Postorder** |
| Level-by-level, or shortest depth | Level order (BFS) |
| Path from root down | Preorder with a path list |

Postorder deserves emphasis: "compute something about this node that depends on
its children" — height, balance, subtree sums, diameter — is always postorder,
because you need both children's answers before you can produce your own.

## 6. Complexity

| Operation | Balanced | Worst (degenerate) |
|---|---|---|
| Traversal (any) | O(n) | O(n) |
| BST search / insert / delete | O(log n) | **O(n)** |
| Height | O(n) | O(n) |
| Space (recursive) | O(log n) stack | **O(n) stack** |
| Space (level order) | O(width) | O(n) |

A BST built from sorted input degenerates into a linked list — every operation
O(n). This is why production uses self-balancing trees (red-black in
`SortedDictionary`, Book 08).

## 7. C# specifics

```csharp
public class TreeNode
{
    public int val;
    public TreeNode left, right;
    public TreeNode(int val = 0, TreeNode left = null, TreeNode right = null)
    { this.val = val; this.left = left; this.right = right; }
}
```

.NET has **no general-purpose tree type**. `SortedDictionary`/`SortedSet` are
red-black trees but expose no node API. So trees are hand-rolled in interviews,
and in production you either use a library, model it in a database, or write a
small node class.

Useful idioms:

```csharp
// Null-conditional keeps traversals terse
int Height(TreeNode n) => n == null ? 0 : 1 + Math.Max(Height(n.left), Height(n.right));

// BST validation: pass down the allowed range, do NOT just compare to the parent
bool Valid(TreeNode n, long lo, long hi)
    => n == null || (lo < n.val && n.val < hi
                     && Valid(n.left, lo, n.val) && Valid(n.right, n.val, hi));

// Iterative inorder with an explicit stack (04)
var st = new Stack<TreeNode>(); var cur = root;
while (cur != null || st.Count > 0)
{
    while (cur != null) { st.Push(cur); cur = cur.left; }
    cur = st.Pop(); Visit(cur); cur = cur.right;
}
```

The BST validation note is worth dwelling on: comparing each node only to its
immediate parent is the classic wrong answer. A node deep in the left subtree
can be larger than the root while satisfying every local parent check.

## 8. Common mistakes

1. **Null checks.** Every traversal starts with one; leaf children are null.
2. **Validating a BST against the parent only** instead of a min/max range.
3. **Using `int.MinValue`/`int.MaxValue` as range sentinels** when node values
   can be exactly those — use `long`, or nullable bounds.
4. **Confusing depth and height.** Depth counts down from the root; height
   counts up from the leaves.
5. **Choosing the wrong traversal** — trying to compute height in preorder.
6. **Forgetting the level-size snapshot** in level order.
7. **Stack overflow on a degenerate tree** of 10^5 nodes — go iterative.
8. **Recomputing height inside a balance check**, making it O(n^2). Return
   height and balance together in one postorder pass.

## 9. Correct-book problems

- Maximum / Minimum Depth of Binary Tree
- Invert Binary Tree; Symmetric Tree; Same Tree
- Binary Tree Level Order Traversal; Zigzag; Right Side View
- Validate Binary Search Tree
- Lowest Common Ancestor (BST version uses ordering; binary-tree version does not)
- Kth Smallest Element in a BST — inorder, stop at k
- Path Sum I / II / III
- Diameter of Binary Tree — postorder returning height
- Balanced Binary Tree
- Serialize and Deserialize Binary Tree
- Construct Tree from Preorder + Inorder
- Convert Sorted Array to BST (pick the middle → balanced)
- Flatten Binary Tree to Linked List
- Trie problems (Implement Trie, Word Search II) — a tree over an alphabet

## 10. Where Trees look right but are wrong

- **The structure has cycles or multiple parents** → that is a graph (16), and
  tree algorithms will loop forever without a `visited` set.
- **You only need sorted data** → sort an array. A BST is for *mutating* sorted
  data (08).
- **Flat data with no hierarchy** — do not impose a tree.
- **Shortest path by edge count** → BFS, not recursive DFS (17).
- **You need O(1) lookup by key** → Dictionary (02); a BST gives O(log n).
- **Unbalanced input risk in production** → use `SortedDictionary` rather than a
  hand-rolled BST (08).

---

## Production Lens

Real hierarchies rarely live in a `TreeNode`. They live in a database
(adjacency list, nested sets, materialized path, or `hierarchyid`), in a JSON
document, or in a file system. The algorithmic knowledge transfers; the storage
model is the actual design decision, and the usual mistake is a recursive query
per node (the N+1 problem) rather than one query plus an in-memory tree build.

The in-memory build is a `Dictionary<id, node>` pass followed by a parent-link
pass — Book 02 doing the real work.

For untrusted nested input (JSON, XML), bound the depth: recursion over
attacker-controlled nesting is an uncatchable stack overflow (13).

**Related:** [[Book13-Recursion]], [[Book16-Graphs]], [[Book17-BFS]],
[[Book18-DFS]], [[Book08-SortedSet-SortedDictionary]], [[Book05-Queue]].
