# Exercises — Book 05: Queue

**Reach for it when:** FIFO, level-by-level, "fewest steps", multi-source spread.
**The idiom:** `int size = q.Count;` before the inner loop — that is what makes a
traversal a *distance* computation. Mark visited at **enqueue**, not dequeue.

---

### E05.1 — Binary Tree Level Order Traversal
Given a binary tree, return its node values grouped level by level, as a list of
lists.

- **Constraints:** up to 2000 nodes.
- **Target:** O(n) time, O(width) space.
- **Edge cases:** null root (empty result); single node; completely
  left-skewed tree (every level has one node).
- **Before you code:** what one line tells you where a level ends? Write it
  before anything else.
- *(Stub exists: `DSA/10-Trees`.)*

### E05.2 — Number of Recent Calls
Implement a counter with `Ping(int t)`, called with strictly increasing
timestamps. Each call returns how many pings occurred in the inclusive window
`[t - 3000, t]`.

- **Constraints:** up to 10⁴ calls; timestamps strictly increasing.
- **Target:** amortized O(1) per call.
- **Edge cases:** first call; all calls inside one window; a long gap making the
  window empty except the current ping.
- **Before you code:** which end do old pings leave from, and which end do new
  ones enter? That answer names the structure.

### E05.3 — Rotting Oranges
A grid contains `0` (empty), `1` (fresh orange), `2` (rotten). Each minute, a
rotten orange rots every fresh orange **adjacent** to it (4-directionally).
Return the minutes until no fresh orange remains, or `-1` if impossible.

- **Constraints:** grid up to 10 × 10.
- **Target:** O(rows · cols) time and space.
- **Edge cases:** no fresh oranges at start (answer 0); a fresh orange walled off
  by empty cells (answer −1); no rotten oranges but fresh ones exist (−1); empty
  grid.
- **Before you code:** there is more than one rotten orange at minute zero. What
  does that mean for how you initialize the queue? Name the technique.

### E05.4 — Open the Lock
A lock has 4 wheels, each `0`–`9`, wrapping around. One move turns one wheel one
click. Starting from `"0000"`, find the fewest moves to reach a target, without
ever passing through a "deadend" combination. Return `-1` if impossible.

- **Constraints:** up to 500 deadends.
- **Target:** O(10⁴ · 8) — the state space is all 4-digit combinations.
- **Edge cases:** `"0000"` is a deadend; target is `"0000"` (answer 0); target
  unreachable.
- **Before you code:** what are the "nodes" here? There is no graph in the input
   — you have to see one. Say what a node is and what makes two nodes adjacent.

### E05.5 — Implement Stack using Queues
Implement a LIFO stack using only queue operations (`Enqueue`, `Dequeue`,
`Peek`, `Count`).

- **Constraints:** you may use one or two queues. All operations must be valid;
  at least one of `Push`/`Pop` will be O(n).
- **Edge cases:** push then pop immediately; interleaved pushes and pops; single
  element.
- **Before you code:** you can make `Push` expensive or `Pop` expensive, but not
  both cheap. Pick one and say why. Can you do it with a **single** queue?

---
---

# ⛔ STOP — hints below

---

**E05.1**
- *Nudge:* Freeze the level boundary before you start consuming it.
- *Structure:* `Queue<TreeNode>`.
- *Skeleton:*
  ```
  while (q.Count > 0) {
      int size = q.Count;              // <-- the whole trick
      for (int i = 0; i < size; i++) { var n = q.Dequeue(); ...enqueue children... }
  }
  ```

**E05.2**
- *Nudge:* Old pings expire from the front; new ones arrive at the back.
- *Structure:* `Queue<int>` of timestamps.
- *Skeleton:* `q.Enqueue(t); while (q.Peek() < t - 3000) q.Dequeue(); return q.Count;`
  Amortized O(1) because each timestamp is dequeued at most once.

**E05.3**
- *Nudge:* Multi-source BFS.
- *Structure:* `Queue<(int r, int c)>`, plus a count of fresh oranges.
- *Skeleton:* enqueue **every** rotten orange before the loop starts. Then run
  the standard level-counting BFS, decrementing the fresh count as you rot each
  one. At the end, `fresh == 0 ? minutes : -1`. Careful: if there were no fresh
  oranges to begin with, the answer is 0, not the level count.

**E05.4**
- *Nudge:* Each 4-digit combination is a node; two nodes are adjacent if they
  differ by one click on one wheel.
- *Structure:* `Queue<string>`, `HashSet<string>` for deadends **and** visited.
- *Skeleton:* 8 neighbours per state (4 wheels × 2 directions). Wrap with
  `(d + 1) % 10` and `(d + 9) % 10`. Seed visited with the deadends so you never
  enqueue one, and check `"0000"` against deadends before you start.

**E05.5**
- *Nudge:* A queue reversed is a stack.
- *Structure:* one `Queue<int>` is enough.
- *Skeleton (O(n) push):* enqueue the new item, then dequeue-and-re-enqueue the
  other `Count - 1` items so the newest ends up at the front. `Pop` and `Peek`
  are then plain O(1) queue operations.
