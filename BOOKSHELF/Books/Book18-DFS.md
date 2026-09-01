# Book 18 — DFS (Depth-First Search)

> The book of *"go deep, then come back."*

## 1. What problem does this book solve?

Exhaustively exploring a structure by following one path as far as it goes
before retreating. DFS is the natural traversal for questions about
**existence**, **structure**, and **whole paths** — anything where you do not
need distances.

## 2. Signals

- "Does a path exist?" / "can you reach"
- "All paths" / "every route" / "enumerate"
- "Connected components" / "islands" / "regions" / "clusters"
- "Cycle detection"
- "Flood fill" / "fill the region"
- Tree traversals: preorder, inorder, postorder (15)
- "Compute something about each subtree" → postorder DFS
- Topological sort (the DFS formulation, via reverse postorder)
- Backtracking of any kind (14)
- "Explore all possibilities"

**DFS vs BFS, decided in one question:** *does the answer depend on distance?*
Yes → BFS (17). No → DFS, which is simpler, uses less memory, and recurses
naturally.

## 3. The naive instinct

Using BFS everywhere because "it is the safe one," and paying O(V) frontier
memory to answer a question that needs none. Or hand-rolling region-merging
logic instead of recognizing a flood fill.

## 4. Why that matters

For connectivity, components, and cycles, BFS and DFS are both O(V + E) — but
DFS's space is O(depth), which on a wide graph is dramatically less than BFS's
O(width) frontier. And recursive DFS is often four lines where BFS is twelve.

The counter-risk: DFS's O(depth) is a **call stack**, and a deep graph
overflows it. That is the tradeoff, stated honestly.

## 5. What to recognize

```csharp
// Recursive — the default
void Dfs(int node)
{
    if (!visited.Add(node)) return;        // Book 01 idiom: add returns false if seen
    foreach (var next in adj[node]) Dfs(next);
}

// Iterative — when depth is a risk
var st = new Stack<int>();
st.Push(start);
while (st.Count > 0)
{
    int cur = st.Pop();
    if (!visited.Add(cur)) continue;       // check on POP, since duplicates can be pushed
    foreach (var next in adj[cur]) st.Push(next);
}
```

Note the difference from BFS: in iterative DFS you check `visited` on **pop**,
not push, because a node can legitimately be pushed several times before it is
first popped.

**Counting components** — the outer loop is the part people forget:

```csharp
int components = 0;
for (int i = 0; i < n; i++)
    if (!visited.Contains(i)) { Dfs(i); components++; }
```

**Grid flood fill** — mutate in place as the visited marker:

```csharp
void Fill(int r, int c)
{
    if (r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] != '1') return;
    grid[r][c] = '0';                       // sink it: marks visited, no extra memory
    Fill(r+1, c); Fill(r-1, c); Fill(r, c+1); Fill(r, c-1);
}
```

**Cycle detection in a directed graph** needs *three* states, not two — this is
the subtlety that separates a correct answer from a plausible one:

```csharp
// 0 = unvisited, 1 = in the current path, 2 = fully explored
bool HasCycle(int u)
{
    if (state[u] == 1) return true;         // back edge -> cycle
    if (state[u] == 2) return false;        // already cleared
    state[u] = 1;
    foreach (var v in adj[u]) if (HasCycle(v)) return true;
    state[u] = 2;                            // done with this path
    return false;
}
```

A plain `visited` set finds cross-edges to already-finished nodes and reports a
cycle that does not exist. For **undirected** graphs it is different again: track
the parent and ignore the edge you came in on.

## 6. Complexity

| | Time | Space |
|---|---|---|
| DFS on a graph | O(V + E) | O(V) visited + O(depth) stack |
| DFS on an R x C grid | O(R * C) | O(R * C) worst-case stack |
| All paths enumeration | O(V!) worst case | O(depth) |
| Cycle detection | O(V + E) | O(V) |

Recursive depth on a 1000x1000 grid can reach 10^6 — far past .NET's ~1 MB
stack. Grid DFS at that scale must be iterative.

## 7. C# specifics

```csharp
// Local function with captured state — the idiomatic shape
int CountIslands(char[][] grid)
{
    int rows = grid.Length, cols = grid[0].Length, count = 0;

    void Sink(int r, int c)
    {
        if (r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] != '1') return;
        grid[r][c] = '0';
        Sink(r + 1, c); Sink(r - 1, c); Sink(r, c + 1); Sink(r, c - 1);
    }

    for (int r = 0; r < rows; r++)
        for (int c = 0; c < cols; c++)
            if (grid[r][c] == '1') { Sink(r, c); count++; }

    return count;
}
```

For guaranteed-deep recursion, run on a thread with a bigger stack:

```csharp
var t = new Thread(() => result = Solve(), maxStackSize: 64 * 1024 * 1024);
t.Start(); t.Join();
```

That is a legitimate interview answer when asked "what if the grid is huge?"

## 8. Common mistakes

1. **No `visited`** → infinite recursion on any cycle.
2. **Two-state visited for directed cycle detection** → false positives. Use
   three states.
3. **Undirected cycle detection without tracking the parent** → every edge looks
   like a cycle.
4. **Checking visited on push rather than pop** in iterative DFS.
5. **Stack overflow** on large grids or deep graphs.
6. **Forgetting the outer loop** over all nodes, missing disconnected
   components.
7. **Using DFS for shortest paths.** Wrong answers, not slow ones (17).
8. **Not restoring state** when the DFS is really backtracking (14).

## 9. Correct-book problems

- Number of Islands; Max Area of Island; Flood Fill
- Course Schedule (DFS cycle detection with three states)
- Clone Graph
- Path Sum; Binary Tree Paths; all root-to-leaf enumerations (15)
- Surrounded Regions — DFS inward from the borders
- Pacific Atlantic Water Flow — two DFS passes from opposite edges
- Word Search — DFS with backtracking on a grid (14)
- Number of Provinces; Graph Valid Tree
- Keys and Rooms
- Longest Increasing Path in a Matrix — DFS + memoization (19)
- Time Needed to Inform All Employees — tree DFS
- All Paths From Source to Target

## 10. Where DFS looks right but is wrong

- **Shortest path / fewest steps** → BFS (17). DFS with a visited set can mark a
  node via a long path and permanently block the short one.
- **"Nearest" anything** → BFS.
- **Very deep structures** → iterative, or you crash.
- **You need level information** → BFS naturally has it.
- **Weighted shortest path** → Dijkstra (07).
- **Overlapping subproblems in the recursion** → add memoization; it becomes DP
  (19).

---

## Production Lens

DFS is the traversal in dependency walkers, file-system scanners, serializers,
and cycle detectors in build tooling. Two production hazards dominate:

**Depth on untrusted input.** Recursive DFS over attacker-controlled nesting is
an uncatchable `StackOverflowException`. Bound it or go iterative.

**Symlink and cycle loops** in file-system walks — a symlink pointing to an
ancestor makes an infinite traversal. `EnumerateFiles` with
`RecurseSubdirectories` handles a lot of this for you; hand-rolled walkers
usually do not.

**Related:** [[Book17-BFS]], [[Book16-Graphs]], [[Book13-Recursion]],
[[Book14-Backtracking]], [[Book04-Stack]], [[Book15-Trees]].
