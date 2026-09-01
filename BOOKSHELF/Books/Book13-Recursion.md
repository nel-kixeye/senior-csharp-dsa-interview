# Book 13 — Recursion

> The book of *"this problem contains a smaller copy of itself."*

## 1. What problem does this book solve?

Expressing a computation in terms of the same computation on smaller input. When
the *data* is recursive (trees, nested structures, graphs) or the *decomposition*
is recursive (divide and conquer), recursion lets the code mirror the shape of
the problem instead of simulating it.

## 2. Signals

- Tree / hierarchy / nested structure (15)
- "Subproblem" / "smaller instance of the same problem"
- Divide and conquer: "split in half, solve each, combine"
- "All combinations / permutations / paths" → backtracking (14)
- The input is defined recursively (nested JSON, expressions, folders)
- Graph traversal where depth matters more than breadth (18)
- Merge sort, quick sort, binary search (as divide and conquer)
- "Explore, then undo" — the shape of search

**The tell:** you can state the answer for input of size n **in terms of** the
answer for size n-1, or n/2, or "each child."

## 3. The naive instinct

Two opposite failure modes here, and both are common.

**Failing to see recursion**, and hand-rolling an explicit stack for a tree
traversal that would be four lines recursively.

**Over-using recursion**, and writing exponential code:

```csharp
long Fib(int n) => n < 2 ? n : Fib(n - 1) + Fib(n - 2);   // O(2^n)
```

## 4. Why that matters

`Fib(50)` recursive is roughly 2^50 calls — it never finishes. The structure is
right; what is missing is the recognition that **the same subproblems recur**.
Adding a memo turns O(2^n) into O(n) without changing the shape (19).

That is the key relationship on this shelf: **recursion + repeated subproblems =
dynamic programming.** DP is not a different idea, it is recursion that stopped
wasting work.

Conversely, when subproblems do *not* overlap (merge sort's halves are
disjoint), plain recursion is already optimal.

## 5. What to recognize

Every correct recursive function has three parts. Write them in this order:

```csharp
ReturnType Solve(Args args)
{
    // 1. Base case — the smallest input you can answer directly
    if (IsTrivial(args)) return TrivialAnswer(args);

    // 2. Recurse on strictly smaller input
    var partial = Solve(Smaller(args));

    // 3. Combine
    return Combine(partial, args);
}
```

"**Strictly smaller**" is the part that gets skipped and causes stack overflows.
Before writing the call, say out loud what measure decreases and why it must
reach the base case.

```csharp
// Tree recursion — the shape you will write most often
int Depth(TreeNode node)
    => node == null ? 0 : 1 + Math.Max(Depth(node.left), Depth(node.right));

// Divide and conquer
int[] MergeSort(int[] a)
{
    if (a.Length <= 1) return a;                  // base
    int mid = a.Length / 2;
    var l = MergeSort(a[..mid]);                  // strictly smaller
    var r = MergeSort(a[mid..]);
    return Merge(l, r);                           // combine
}
```

**Trust the recursion.** The hardest habit to build is assuming the recursive
call already returns the right answer for the subproblem, rather than tracing
the whole tree in your head. Verify the base case and the combine step; do not
simulate.

## 6. Complexity

Count it as: **(number of calls) x (work per call)**.

| Shape | Recurrence | Result |
|---|---|---|
| Halve, constant work | T(n) = T(n/2) + O(1) | O(log n) |
| Halve both, linear combine | T(n) = 2T(n/2) + O(n) | O(n log n) |
| Halve both, constant combine | T(n) = 2T(n/2) + O(1) | O(n) |
| Decrement, constant work | T(n) = T(n-1) + O(1) | O(n) |
| Two branches, decrement | T(n) = 2T(n-1) + O(1) | **O(2^n)** |
| Tree traversal | one call per node | O(nodes) |

**Space is O(depth)** — the call stack. Balanced tree: O(log n). Degenerate
linked-list-shaped tree: O(n). A linked list of 100,000 nodes traversed
recursively **will** overflow the stack.

.NET's default stack is 1 MB per thread — roughly 10,000 to 50,000 frames
depending on locals. There is no tail-call optimization guarantee in C#.

## 7. C# specifics

```csharp
// Local functions capture outer state cleanly — the idiomatic C# shape
List<IList<int>> Traverse(TreeNode root)
{
    var result = new List<IList<int>>();
    var path = new List<int>();

    void Dfs(TreeNode node)              // closes over result and path
    {
        if (node == null) return;
        path.Add(node.val);
        if (node.left == null && node.right == null) result.Add(new List<int>(path));
        Dfs(node.left);
        Dfs(node.right);
        path.RemoveAt(path.Count - 1);   // undo
    }

    Dfs(root);
    return result;
}
```

Prefer a **local function** over a private method with parameters threaded
through, or over instance fields. It keeps the mutable state visibly scoped to
the traversal.

Note `new List<int>(path)` — adding `path` itself would store a reference to a
list you are about to mutate. Every recursive collector has this bug once.

For deep recursion on user-supplied input, either convert to an explicit stack
(04) or run on a thread with a larger stack:

```csharp
var t = new Thread(Work, maxStackSize: 16 * 1024 * 1024);
```

## 8. Common mistakes

1. **Missing or unreachable base case** → `StackOverflowException`, which in
   .NET **cannot be caught** and kills the process immediately.
2. **Not shrinking the input** on some path.
3. **Storing a reference to a mutable accumulator** instead of a copy.
4. **Forgetting to undo** state after the recursive call in backtracking (14).
5. **Recursing on a linked list** of unbounded length.
6. **Recomputing overlapping subproblems** — add a memo (19).
7. **Returning from inside the recursion but ignoring the returned value.**
8. **Passing large structures by value** through every frame.
9. **Assuming C# optimizes tail calls.** It does not, reliably.

## 9. Correct-book problems

- Maximum Depth / Minimum Depth of Binary Tree
- Invert Binary Tree; Symmetric Tree; Same Tree
- Merge Sort; Quick Sort; Quickselect
- Binary Tree Paths; Path Sum I/II
- Flatten Nested List Iterator; nested JSON/expression evaluation
- Pow(x, n) — fast exponentiation by halving
- Validate Binary Search Tree (pass down min/max bounds)
- Lowest Common Ancestor
- Generate Parentheses; Subsets; Permutations (14)
- Tower of Hanoi; Sudoku Solver; N-Queens (14)

## 10. Where Recursion looks right but is wrong

- **Simple linear iteration.** A `for` loop is clearer and cheaper. Recursion is
  not a virtue in itself.
- **Depth may exceed the stack** — long linked lists, deep user input, huge
  graphs. Convert to an explicit stack (04).
- **Overlapping subproblems without memoization** — exponential (19).
- **Tail recursion in a hot loop** — C# will not optimize it; write the loop.
- **Shortest-path problems** — recursion gives DFS, and DFS does not give
  shortest paths in unweighted graphs. Use BFS (17).
- **The iterative version is genuinely clearer** — Fibonacci, factorial, and
  array sums are all better as loops. Recursion earns its place when the *data*
  is recursive.

---

## Production Lens

Recursion over **user-controlled depth is an availability risk**. Deeply nested
JSON, XML, or a malicious directory tree can overflow the stack, and
`StackOverflowException` is uncatchable — the process dies. `System.Text.Json`
has `MaxDepth` (default 64) for exactly this reason.

In production: bound the depth explicitly, or use an explicit stack, or both.
When you write a recursive parser or walker over external input, the depth limit
is not defensive programming, it is a requirement.

**Related:** [[Book14-Backtracking]], [[Book15-Trees]], [[Book18-DFS]],
[[Book19-DynamicProgramming]], [[Book04-Stack]].
