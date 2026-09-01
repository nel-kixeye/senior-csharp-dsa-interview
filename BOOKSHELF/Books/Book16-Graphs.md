# Book 16 — Graphs

> The book of *"these things are connected."*

## 1. What problem does this book solve?

Modelling arbitrary relationships between entities — anything where "A relates
to B" and the relation can form cycles, multiple paths, or disconnected
clusters. A tree is a graph with restrictions; a graph is the general case.

Most graph problems are not *hard*. They are hard to **recognize**, because the
problem statement rarely says "graph."

## 2. Signals

- "Connected" / "linked" / "related" / "network"
- "Path between A and B" / "can you reach"
- "Dependencies" / "prerequisites" / "must come before" → topological sort
- "Friends" / "followers" / "social network"
- "Routes" / "flights" / "roads" / "maps"
- **"Grid" or "matrix"** — a grid is a graph; each cell has up to 4 (or 8)
  neighbours. This is the most commonly missed disguise.
- "Islands" / "regions" / "clusters" / "groups" → connected components
- "Cycle" / "circular dependency" / "deadlock"
- "Transform one word/state into another" → nodes are states, edges are moves
- "Course schedule" / "build order" / "task ordering"
- "Infection spreads" / "flood fill"

**The universal reframing question:** *what are my nodes, and what makes two of
them adjacent?* If you can answer that, it is a graph problem, and the rest is
choosing BFS or DFS.

## 3. The naive instinct

Treating the input literally — looping over a grid cell by cell trying to reason
about regions, or over an edge list repeatedly asking "is there an edge from
here to there?"

```csharp
// "Are A and B connected?" over an edge list
foreach (var (u, v) in edges)         // rescanning all edges per step
    if (u == current) ...
```

## 4. Why that is inferior

Scanning an edge list per lookup is O(E) per step, so traversal becomes
O(V * E). Building an adjacency list once costs O(E) and makes every neighbour
lookup O(degree). Traversal drops to O(V + E).

The bigger failure is not recognizing the graph at all, and writing ad-hoc
region-merging logic for what is a five-line flood fill.

## 5. What to recognize

**Build the adjacency list first.** Almost every graph problem starts here:

```csharp
var adj = new Dictionary<int, List<int>>();
foreach (var (u, v) in edges)
{
    if (!adj.TryGetValue(u, out var lu)) adj[u] = lu = new List<int>();
    lu.Add(v);
    if (!adj.TryGetValue(v, out var lv)) adj[v] = lv = new List<int>();
    lv.Add(u);            // omit this line for a DIRECTED graph
}

// Dense integer labels 0..n-1: prefer arrays
var adjArr = new List<int>[n];
for (int i = 0; i < n; i++) adjArr[i] = new List<int>();
```

**Grids without building anything** — the adjacency is implicit:

```csharp
static readonly int[] dr = { -1, 1, 0, 0 };
static readonly int[] dc = { 0, 0, -1, 1 };

for (int d = 0; d < 4; d++)
{
    int nr = r + dr[d], nc = c + dc[d];
    if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;   // bounds first
    ...
}
```

**The three core traversals:**

```csharp
// DFS (recursive) — reachability, components, cycles
void Dfs(int node)
{
    if (!visited.Add(node)) return;          // Book 01 idiom
    foreach (var next in adj[node]) Dfs(next);
}

// BFS — shortest path in an UNWEIGHTED graph
var q = new Queue<int>(); q.Enqueue(start);
var visited = new HashSet<int> { start };
int steps = 0;
while (q.Count > 0)
{
    int size = q.Count;
    for (int i = 0; i < size; i++)
    {
        int cur = q.Dequeue();
        foreach (var next in adj[cur])
            if (visited.Add(next)) q.Enqueue(next);
    }
    steps++;
}

// Topological sort (Kahn) — ordering under dependencies
var indeg = new int[n];
foreach (var (u, v) in edges) indeg[v]++;
var q2 = new Queue<int>();
for (int i = 0; i < n; i++) if (indeg[i] == 0) q2.Enqueue(i);
var order = new List<int>();
while (q2.Count > 0)
{
    int u = q2.Dequeue(); order.Add(u);
    foreach (var v in adj[u]) if (--indeg[v] == 0) q2.Enqueue(v);
}
bool hasCycle = order.Count != n;      // leftover nodes => cycle
```

That last line is the elegant part: Kahn's algorithm detects cycles for free.

**The three companions**, which is the relationship worth internalizing:

- **Graph + Queue** = BFS = shortest path, level order
- **Graph + Stack/Recursion** = DFS = reachability, components, cycles
- **Graph + HashSet** = `visited` = termination. Without it, any cycle loops
  forever. This is the difference between graphs and trees.

## 6. Complexity

| Algorithm | Time | Space |
|---|---|---|
| Build adjacency list | O(V + E) | O(V + E) |
| BFS / DFS | O(V + E) | O(V) |
| Grid traversal | O(rows * cols) | O(rows * cols) |
| Topological sort | O(V + E) | O(V) |
| Dijkstra (binary heap) | O((V + E) log V) | O(V) |
| Bellman-Ford (negative weights) | O(V * E) | O(V) |
| Union-Find (near-linear) | O(E * α(V)) | O(V) |

Adjacency **list** is O(V + E) space; adjacency **matrix** is O(V^2) but gives
O(1) edge existence checks. Use the matrix only for dense graphs or when you
query specific edges constantly.

## 7. C# specifics

```csharp
// Dense int labels: arrays beat dictionaries
var visited = new bool[n];
var adj = new List<int>[n];

// Sparse / non-integer labels: dictionaries
var adj2 = new Dictionary<string, List<string>>();
var visited2 = new HashSet<string>();

// Grid visited: mutate in place if allowed (no extra allocation)
grid[r][c] = '0';       // "sink" the island

// Union-Find — worth having memorized for connectivity problems
class DSU
{
    private readonly int[] p, rank;
    public DSU(int n) { p = new int[n]; rank = new int[n];
                        for (int i = 0; i < n; i++) p[i] = i; }
    public int Find(int x) => p[x] == x ? x : p[x] = Find(p[x]);   // path compression
    public bool Union(int a, int b)
    {
        int ra = Find(a), rb = Find(b);
        if (ra == rb) return false;                 // already connected
        if (rank[ra] < rank[rb]) (ra, rb) = (rb, ra);
        p[rb] = ra;
        if (rank[ra] == rank[rb]) rank[ra]++;
        return true;
    }
}
```

Union-Find is the right tool when the question is purely "are these connected?"
or "how many components?" and edges arrive incrementally. It beats DFS when you
must answer connectivity queries *during* construction.

## 8. Common mistakes

1. **No `visited` set.** Infinite loop on the first cycle. The single most
   common graph bug.
2. **Marking visited on dequeue rather than enqueue** — nodes enter the queue
   many times.
3. **Bounds check after indexing** in grid problems — check before.
4. **Adding both directions for a directed graph** (or forgetting the reverse
   edge for an undirected one).
5. **BFS on a weighted graph** for shortest path. Use Dijkstra (07).
6. **Dijkstra with negative weights** — invalid; use Bellman-Ford.
7. **Forgetting disconnected components** — loop over all nodes as potential
   starts, do not just traverse from node 0.
8. **Recursive DFS on a 10^5-node graph** — stack overflow; go iterative (13).
9. **Not handling self-loops or duplicate edges** when the input allows them.

## 9. Correct-book problems

- Number of Islands; Max Area of Island; Flood Fill — grid components
- Course Schedule I/II — cycle detection and topological sort
- Clone Graph — traversal plus a `Dictionary<old,new>` (02)
- Word Ladder — implicit graph over word states
- Rotting Oranges; 01 Matrix — multi-source BFS
- Pacific Atlantic Water Flow — reverse traversal from the borders
- Surrounded Regions — mark from the edges inward
- Network Delay Time; Cheapest Flights Within K Stops — Dijkstra / Bellman-Ford
- Number of Connected Components; Graph Valid Tree — Union-Find or DFS
- Redundant Connection — Union-Find; the first edge that closes a cycle
- Alien Dictionary — topological sort over inferred letter order
- Accounts Merge — Union-Find over emails

## 10. Where Graphs look right but are wrong

- **The structure is a tree** (no cycles, one parent) — you can skip `visited`
  and simplify (15).
- **The relation is a simple lookup** — a Dictionary answers "who is A's
  manager" without a traversal (02).
- **Weighted shortest path** — BFS is the wrong algorithm, not just slow (07).
- **You only need connectivity counts on a static graph** — Union-Find is
  simpler than a full traversal framework.
- **Dense graph with V^2 edges** — an adjacency matrix and simple loops may beat
  list machinery.
- **The "graph" has no edges to speak of** — do not build machinery for a
  problem that is really sorting or counting.

---

## Production Lens

Real graphs: service dependency maps, permission inheritance, package/version
resolution, workflow DAGs, social relations, routing. The recurring production
issues are **cycle detection** (a circular dependency that hangs a build) and
**scale** (the graph does not fit in memory).

Before hand-rolling, check whether the problem is already someone's product:
`QuikGraph` for in-memory algorithms, a graph database for persistent traversal,
or the build system's own DAG. And whenever you write a traversal over
production data, bound it — a runaway traversal over a cyclic production graph
is an outage.

**Related:** [[Book17-BFS]], [[Book18-DFS]], [[Book05-Queue]],
[[Book01-HashSet]], [[Book07-PriorityQueue]], [[Book15-Trees]].
