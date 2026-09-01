# Book 17 — BFS (Breadth-First Search)

> The book of *"fewest steps."*

## 1. What problem does this book solve?

Exploring outward in **rings of equal distance** from a source. The consequence
that makes BFS irreplaceable: the first time you reach a node, you have reached
it by the **shortest** path (in edge count). No other traversal gives you that.

## 2. Signals

- "**Minimum** / **fewest** / **shortest** number of steps, moves, changes"
- "Shortest path" in an **unweighted** graph or grid
- "Level by level" / "layer" / "round" / "generation"
- "Nearest" / "closest" X to each cell
- "How many steps until everything is ..." → multi-source BFS
- "Spreads" / "infects" / "rots" / "floods" over discrete time
- Word/state transformation: "one letter at a time"
- Tree level-order traversal (15)

**The decisive keyword is "minimum."** If a traversal problem asks for the
fewest anything, and edges are unweighted, it is BFS. If it just asks whether
something is reachable, DFS is fine and cheaper (18).

## 3. The naive instinct

DFS, because recursion is easier to write:

```csharp
int MinSteps(Node cur, int depth)
{
    if (cur == target) return depth;
    int best = int.MaxValue;
    foreach (var n in Neighbors(cur))
        best = Math.Min(best, MinSteps(n, depth + 1));   // explores everything
    return best;
}
```

## 4. Why that is inferior

This explores **every** path to find the shortest — exponential in the worst
case, and it needs careful visited-handling to terminate at all. BFS finds the
same answer in O(V + E) by construction, because it never examines a longer path
before a shorter one.

Using DFS and taking the minimum is not just slower; with a naive `visited` set
it is **wrong**, because the first DFS path to a node marks it visited and
blocks the shorter path that BFS would have found.

## 5. What to recognize

The level-counting BFS. The `int size = q.Count` snapshot is what turns a
traversal into a distance computation:

```csharp
int Bfs(Node start, Node target)
{
    var q = new Queue<Node>();
    var visited = new HashSet<Node> { start };
    q.Enqueue(start);
    int steps = 0;

    while (q.Count > 0)
    {
        int size = q.Count;                     // this level's boundary
        for (int i = 0; i < size; i++)
        {
            var cur = q.Dequeue();
            if (cur == target) return steps;

            foreach (var next in Neighbors(cur))
                if (visited.Add(next))          // mark at ENQUEUE time
                    q.Enqueue(next);
        }
        steps++;                                // one full ring done
    }
    return -1;                                  // unreachable
}
```

**Multi-source BFS** — enqueue every source before the loop starts, and the
result is the distance to the *nearest* source for every node, in one pass:

```csharp
foreach (var s in allSources) { q.Enqueue(s); visited.Add(s); }
// then the identical loop
```

Rotting Oranges, 01 Matrix, and "nearest exit" are all this. Recognizing that
"distance to the nearest of many sources" needs no extra machinery — just a
fuller initial queue — is a genuine unlock.

**Path reconstruction** — store parents, walk back:

```csharp
var parent = new Dictionary<Node, Node>();
// on discovery: parent[next] = cur;
// afterwards: walk parent from target back to start, then reverse
```

Never enqueue whole paths; that is O(V * length) memory.

## 6. Complexity

| | Time | Space |
|---|---|---|
| BFS on a graph | O(V + E) | O(V) |
| BFS on an R x C grid | O(R * C) | O(R * C) |
| Multi-source BFS | O(V + E) | O(V) |
| Bidirectional BFS | O(b^(d/2)) vs O(b^d) | O(b^(d/2)) |

Space is the queue plus the visited set. BFS's frontier can be **much** larger
than DFS's stack — on a wide graph, BFS may hold O(V) nodes where DFS holds
O(depth). That is the main reason to prefer DFS when you do not need distances.

**Bidirectional BFS** — search from both ends and meet in the middle — squares
down the branching factor. Worth mentioning in an interview for Word Ladder.

## 7. C# specifics

```csharp
var q = new Queue<(int r, int c)>();       // tuples for grid coordinates
var q2 = new Queue<(Node node, int dist)>(); // alternative: carry distance per item

// visited as a bool[,] for grids — faster than a HashSet of tuples
var seen = new bool[rows, cols];

// Deconstruct on dequeue
var (r, c) = q.Dequeue();
```

Two ways to track distance: the level-snapshot loop (above), or carrying
`(node, dist)` in the queue. The snapshot is cleaner when you need "all nodes at
distance k"; carrying the distance is cleaner when you only need the target's.

For grids, `bool[,]` beats `HashSet<(int,int)>` substantially — no hashing, no
tuple boxing, contiguous memory.

## 8. Common mistakes

1. **Marking visited at dequeue instead of enqueue.** Duplicates flood the
   queue; complexity blows up.
2. **Forgetting the level snapshot** when you need a step count.
3. **Using BFS on a weighted graph.** Edge weights break the ring invariant →
   Dijkstra (07).
4. **Using a Stack instead of a Queue** — silently returns a non-shortest path.
5. **Checking the target only on dequeue when you could check on enqueue** —
   correct either way, but checking at enqueue exits one level earlier.
6. **Not handling the "start equals target" case** (answer 0).
7. **Unbounded memory** on very wide graphs.
8. **Grid bounds checked after indexing.**

## 9. Correct-book problems

- Binary Tree Level Order Traversal; Right Side View; Zigzag (15)
- Rotting Oranges — multi-source
- 01 Matrix — multi-source distance transform
- Number of Islands (BFS flavour) (16)
- Word Ladder — implicit state graph, ideal for bidirectional BFS
- Open the Lock — state space over 4-digit combinations
- Shortest Path in Binary Matrix (8-directional)
- Minimum Knight Moves
- Perfect Squares — fewest squares summing to n, as levels
- Jump Game III; Minimum Genetic Mutation
- Course Schedule II — Kahn's topological sort is BFS-shaped (16)
- Walls and Gates — multi-source from every gate

## 10. Where BFS looks right but is wrong

- **Weighted edges** → Dijkstra: a PriorityQueue instead of a Queue (07). BFS
  returns a wrong answer, not a slow one.
- **You only need reachability or components** → DFS is simpler and uses less
  memory (18).
- **You need every path, not the shortest** → DFS / backtracking (14, 18).
- **The graph is enormous and wide** → the frontier may not fit; consider
  iterative deepening or bidirectional search.
- **Tree problems where depth is computed bottom-up** (height, diameter) →
  postorder DFS (15).
- **Negative weights** → Bellman-Ford; neither BFS nor Dijkstra applies.

---

## Production Lens

BFS shows up as: crawling to a bounded depth, "degrees of separation" queries,
dependency impact analysis ("what breaks if this service goes down"), and cache
warming by proximity.

The production concerns are always the same two: **bound the depth** and
**bound the frontier**. An unbounded BFS over a production graph will happily
consume all available memory. Add a max-depth parameter and a visited-set size
cap from the start, not after the incident.

**Related:** [[Book05-Queue]], [[Book16-Graphs]], [[Book18-DFS]],
[[Book07-PriorityQueue]], [[Book15-Trees]].
