# Exercises — Book 17: BFS

**Reach for it when:** "minimum", "fewest", "shortest" — with **unweighted**
edges.
**Two non-negotiables:** mark visited at **enqueue** time, and snapshot
`int size = q.Count` when you need a step count.

---

### E17.1 — Binary Tree Right Side View
Return the values visible when viewing the tree from the right — the rightmost
node at each depth.

- **Constraints:** up to 100 nodes.
- **Target:** O(n) time, O(width) space.
- **Edge cases:** null root; a purely **left**-skewed tree (every node is visible);
  a node with only a left child at a depth where a deeper right branch exists.
- **Before you code:** with the level-size snapshot, which iteration of the inner
  loop produces the answer for that level? One line.

### E17.2 — 01 Matrix
Given a binary matrix, return a matrix where each cell holds its distance to the
nearest `0`.

- **Constraints:** up to 10⁴ cells; at least one `0` is guaranteed.
- **Target:** O(rows · cols) time — a per-cell BFS would be O((rc)²).
- **Edge cases:** all zeroes; a single `1` surrounded by zeroes; a large block of
  `1`s; single row.
- **Before you code:** running a BFS from every `1` is too slow. Flip it — what do
  you enqueue **before** the loop starts, and what does that give you in one pass?

### E17.3 — Word Ladder
Given `beginWord`, `endWord`, and a word list, return the number of words in the
shortest transformation sequence where each step changes exactly one letter and
every intermediate word is in the list. Return 0 if impossible.

- **Constraints:** up to 5000 words, each up to 10 lowercase letters.
- **Target:** O(N · L · 26).
- **Edge cases:** `endWord` not in the list (return 0); `beginWord == endWord`;
  no possible path; `beginWord` not required to be in the list.
- **Before you code:** to find a word's neighbours, do **not** compare it against
  all N words. What do you generate instead, and what makes checking each
  candidate O(1)?

### E17.4 — Shortest Path in Binary Matrix
In an `n × n` binary matrix, find the length of the shortest clear path from the
top-left to the bottom-right, moving **8-directionally** through `0` cells. Return
`-1` if none exists.

- **Constraints:** `n` up to 100.
- **Target:** O(n²) time.
- **Edge cases:** start or end cell is `1` (return −1 immediately); `n = 1`;
  fully blocked; the whole grid is clear.
- **Before you code:** path length here counts **cells**, not edges. What does
  that mean for your starting step count?

### E17.5 — Walls and Gates
A grid contains `-1` (wall), `0` (gate), and `int.MaxValue` (empty room). Fill
each empty room with the distance to its nearest gate, in place.

- **Constraints:** up to 250 × 250.
- **Target:** O(rows · cols) time.
- **Edge cases:** no gates (grid unchanged); no empty rooms; a room unreachable
  from any gate (stays `int.MaxValue`); all gates.
- **Before you code:** this is E17.2 wearing different clothes. Say in one sentence
  why they are the same algorithm.

---
---

# ⛔ STOP — hints below

---

**E17.1**
- *Nudge:* The last node dequeued at each level is the rightmost one.
- *Skeleton:* inside the level loop, `if (i == size - 1) result.Add(node.val);`
- *Why a left-skewed tree still works:* visibility is per **depth**, not per
  side — if a level's only node is a left child, it is still the rightmost thing
  at that depth.

**E17.2**
- *Nudge:* Multi-source BFS from all the zeroes at once.
- *Skeleton:* enqueue **every** `0` cell before the loop and mark it distance 0;
  set every `1` to "unvisited". Then run a standard BFS — the first time you reach
  a cell, that is its distance to the nearest zero.
- *Why it works:* BFS expands in rings of equal distance. Seeding all sources at
  ring 0 means the rings are simultaneously measuring distance from the whole set.

**E17.3**
- *Nudge:* Generate neighbours by mutation, not comparison.
- *Structure:* `HashSet<string>` of the word list (O(1) membership) + `Queue<string>`.
- *Skeleton:* for each position in the current word, try all 26 letters; if the
  resulting word is in the set and unvisited, enqueue it. **Remove it from the set
  as you enqueue** — that doubles as the visited marker and prevents re-work.
- *Cost:* L positions × 26 letters per word = O(L · 26) neighbours, versus O(N · L)
  to compare against every word. With N = 5000 that is the whole difference.

**E17.4**
- *Nudge:* 8 directions, and the answer counts cells.
- *Skeleton:* start with distance **1** (the start cell itself counts), guard
  `grid[0][0] != 0` up front, and use all eight `(dr, dc)` offsets including
  diagonals. Return the distance when you dequeue the bottom-right cell.
- *The off-by-one:* if you start the counter at 0 you will be one short for every
  path, including the `n = 1` case where the answer is 1.

**E17.5**
- *Nudge:* Gates are the sources.
- *Skeleton:* enqueue every `0` cell, then BFS outward writing
  `grid[nr][nc] = grid[r][c] + 1` for any neighbour still equal to `int.MaxValue`.
  Cells never reached keep `int.MaxValue`, which is the required behaviour for
  unreachable rooms.
- *Why it is the same as E17.2:* both compute, for every cell, the distance to the
  **nearest member of a set of sources** — and multi-source BFS does that in a
  single O(rc) pass regardless of how many sources there are.
