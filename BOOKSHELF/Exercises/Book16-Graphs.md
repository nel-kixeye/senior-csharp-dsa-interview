# Exercises — Book 16: Graphs

**Reach for it when:** things are connected. **A grid is a graph.**
**The reframing question:** what are my nodes, and what makes two adjacent?
**Graph + Queue** = BFS. **Graph + Stack/Recursion** = DFS. **Graph + HashSet** =
termination.

---

### E16.1 — Number of Islands
Given a grid of `'1'` (land) and `'0'` (water), count the islands. Cells connect
4-directionally.

- **Constraints:** grid up to 300 × 300.
- **Target:** O(rows · cols) time and space.
- **Edge cases:** empty grid; all water; all land (one island); islands touching
  only diagonally (they are separate).
- **Before you code:** you need to avoid recounting cells. Name two ways to mark
  visited, and say which one uses no extra memory.
- *(Stub exists: `DSA/11-Graphs`.)*

### E16.2 — Clone Graph
Given a reference to a node in a connected undirected graph, return a deep copy.
Each node has a value and a list of neighbours.

- **Constraints:** up to 100 nodes; the graph may contain cycles.
- **Edge cases:** null input; single node with no neighbours; a node that is its
  own neighbour; cycles (must not recurse forever).
- **Before you code:** two books here. One traverses; the other prevents infinite
  recursion **and** ensures each original node maps to exactly one copy. Name the
  second one's exact key and value types.

### E16.3 — Course Schedule
Given `numCourses` and prerequisite pairs `[a, b]` meaning "b before a",
determine whether all courses can be finished.

- **Constraints:** up to 2000 courses, 5000 prerequisites.
- **Target:** O(V + E) time.
- **Edge cases:** no prerequisites (always true); a self-prerequisite `[0,0]`
  (impossible); disconnected components; duplicate edges.
- **Before you code:** this is cycle detection on a directed graph. Name **two**
  algorithms that do it and say what each gives you beyond the yes/no.

### E16.4 — Pacific Atlantic Water Flow
Given a matrix of heights, the Pacific touches the top and left edges, the
Atlantic the bottom and right. Water flows from a cell to a neighbour of **equal
or lower** height. Return all cells from which water can reach **both** oceans.

- **Constraints:** up to 200 × 200.
- **Edge cases:** single cell (reaches both); all equal heights (all cells);
  single row or column; strictly increasing heights.
- **Before you code:** searching outward from every cell is O((mn)²). What happens
  if you search **backwards** from the ocean edges instead — and what does the
  height comparison become?

### E16.5 — Redundant Connection
A tree with `n` nodes had one extra edge added, creating exactly one cycle. Given
the edges in order, return the **last** edge that can be removed to restore a
tree.

- **Constraints:** up to 1000 nodes; the answer is guaranteed unique.
- **Target:** near O(n) time.
- **Edge cases:** the redundant edge is the last one given; a 3-node cycle; the
  extra edge connects two already-connected distant nodes.
- **Before you code:** you are processing edges one at a time and asking "were
  these two already connected?" That question names a structure that is not BFS or
  DFS. Which one?

---
---

# ⛔ STOP — hints below

---

**E16.1**
- *Nudge:* Find a land cell, then erase its entire island.
- *Skeleton:*
  ```
  for each cell: if (grid[r][c] == '1') { Sink(r, c); count++; }

  void Sink(int r, int c) {
      if (out of bounds || grid[r][c] != '1') return;
      grid[r][c] = '0';                       // marks visited, zero extra memory
      Sink(r±1, c); Sink(r, c±1);
  }
  ```
  The two marking options are a separate `bool[,] visited` or mutating the grid.
  Mutating uses no extra space but destroys the input — say which the interviewer
  prefers.
- *Watch:* on a 300×300 all-land grid the recursion is 90,000 deep. Mention going
  iterative (or BFS) if asked about scale.

**E16.2**
- *Nudge:* You need a map from original node to its clone.
- *Structure:* `Dictionary<Node, Node>` — original → copy. It is both the memo and
  the visited set.
- *Skeleton:*
  ```
  Node Clone(Node node) {
      if (node == null) return null;
      if (map.TryGetValue(node, out var existing)) return existing;
      var copy = new Node(node.val);
      map[node] = copy;                                  // BEFORE recursing
      foreach (var nb in node.neighbors) copy.neighbors.Add(Clone(nb));
      return copy;
  }
  ```
  Registering the copy **before** recursing is what breaks cycles.

**E16.3**
- *Nudge:* Either peel off zero-in-degree nodes, or DFS with three colours.
- *Skeleton (Kahn):* build the adjacency list and in-degree array; enqueue every
  node with in-degree 0; pop, append to the order, decrement neighbours' degrees
  and enqueue any that hit 0. **A cycle exists iff `order.Count != numCourses`.**
- *The two algorithms:* Kahn's gives you a valid topological **order** for free
  (that is Course Schedule II). DFS three-colouring gives you the **specific
  cycle**, because the recursion stack is the path — better when you must report
  what is broken.

**E16.4**
- *Nudge:* Reverse the flow. Start at the oceans and climb.
- *Structure:* two `bool[,]` reachability grids, two multi-source DFS/BFS runs.
- *Skeleton:* seed the Pacific search from every top-row and left-column cell;
  seed the Atlantic from every bottom-row and right-column cell. Moving
  "backwards" means you may step to a neighbour of **greater or equal** height.
  The answer is every cell true in both grids. O(m · n), not O((mn)²).

**E16.5**
- *Nudge:* Union-Find.
- *Skeleton:*
  ```
  var dsu = new DSU(n + 1);
  foreach (var (u, v) in edges)
      if (!dsu.Union(u, v)) return new[] { u, v };   // already connected -> this closes the cycle
  ```
  `Union` returns false when both endpoints already share a root, which means
  adding this edge creates the cycle. Because you process edges in order, the
  first such edge is also the last one that could be removed — which is what was
  asked. (See Book 16 §7 for the DSU implementation with path compression.)
