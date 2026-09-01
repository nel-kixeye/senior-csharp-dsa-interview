# Exercises — Book 18: DFS

**Reach for it when:** existence, structure, whole paths, components — anything
where the answer does **not** depend on distance.
**Iterative DFS:** check visited on **pop**, not push (unlike BFS).
**Directed cycle detection needs three states**, not two.

---

### E18.1 — Flood Fill
Starting from a given pixel in an image, replace its colour and the colour of all
4-directionally connected pixels of the same original colour.

- **Constraints:** image up to 50 × 50.
- **Target:** O(rows · cols) time.
- **Edge cases:** **the new colour equals the original colour** (infinite
  recursion if unguarded — this is the trap); starting pixel is isolated; the
  whole image is one colour.
- **Before you code:** name the guard that prevents the infinite loop, and say why
  the obvious `if (visited)` check is not what saves you here.

### E18.2 — Max Area of Island
Given a binary grid, return the area of the largest island (0 if there is none).

- **Constraints:** up to 50 × 50.
- **Target:** O(rows · cols) time.
- **Edge cases:** no land (0); the entire grid is one island; several islands of
  equal size; single cell.
- **Before you code:** E16.1 counted islands; this one measures them. What does
  your recursive function need to **return** now that it did not before?

### E18.3 — Path Sum II
Return **all** root-to-leaf paths whose values sum to a target.

- **Constraints:** up to 5000 nodes; values may be negative.
- **Target:** O(n · height) time (the copying dominates).
- **Edge cases:** null root; a single node equal to the target; negative values
  meaning you cannot prune on "sum already exceeded"; a matching sum at an
  **internal** node (does not count — must be a leaf).
- **Before you code:** two traps. First, what defines a leaf (be precise — a node
  with one child is not one). Second, what must you do to `path` before adding it
  to the results?

### E18.4 — Surrounded Regions
In a board of `'X'` and `'O'`, capture every region of `'O'`s that is **entirely
surrounded** by `'X'`s, by flipping those `'O'`s to `'X'`. A region touching the
border is not captured.

- **Constraints:** up to 200 × 200.
- **Edge cases:** all `'O'` (nothing captured); all `'X'`; a single row or column
  (nothing can be surrounded); a region touching the border only at one corner
  cell.
- **Before you code:** identifying surrounded regions directly is awkward.
  Identify the **complement** instead — what is easy to find, and how do you use
  it?

### E18.5 — Longest Increasing Path in a Matrix
Return the length of the longest strictly increasing path in a matrix, moving
4-directionally.

- **Constraints:** up to 200 × 200.
- **Target:** O(rows · cols) time — plain DFS from every cell is exponential.
- **Edge cases:** all equal values (answer 1); strictly increasing across the
  whole grid; single cell; a single row.
- **Before you code:** why do you **not** need a visited set here? (The answer is
  a property of "strictly increasing" — say it.) And what turns the exponential
  version into a linear one?

---
---

# ⛔ STOP — hints below

---

**E18.1**
- *Nudge:* If the new colour equals the old one, every recursive call still sees a
  matching pixel.
- *Skeleton:* guard up front — `if (image[sr][sc] == newColor) return image;` —
  then recurse, repainting as you go. Repainting *is* the visited marker, which is
  exactly why it fails when the two colours are identical.

**E18.2**
- *Nudge:* Return the size of the component you just erased.
- *Skeleton:*
  ```
  int Area(int r, int c) {
      if (out of bounds || grid[r][c] == 0) return 0;
      grid[r][c] = 0;
      return 1 + Area(r+1,c) + Area(r-1,c) + Area(r,c+1) + Area(r,c-1);
  }
  // outer loop: best = Math.Max(best, Area(r, c));
  ```
  E16.1's version returned `void` and counted calls; this one returns a count and
  sums it. Same traversal, different payload.

**E18.3**
- *Nudge:* Carry a running path and remaining target; undo on the way out.
- *Skeleton:*
  ```
  path.Add(node.val);
  if (node.left == null && node.right == null && remaining == node.val)
      res.Add(new List<int>(path));            // COPY, not the reference
  else { Dfs(node.left, remaining - node.val); Dfs(node.right, remaining - node.val); }
  path.RemoveAt(path.Count - 1);               // UNDO
  ```
  A leaf is `left == null && right == null` — a node with exactly one child is not
  a leaf, and treating it as one is the classic wrong answer.

**E18.4**
- *Nudge:* Find the `'O'`s that are **safe** — connected to the border — and flip
  everything else.
- *Skeleton:* DFS from every `'O'` on the four borders, marking those regions with
  a temporary sentinel (e.g. `'#'`). Then one final sweep: every remaining `'O'`
  becomes `'X'`, and every `'#'` reverts to `'O'`.
- *Why the complement:* "touches the border" is a local, easily-seeded condition;
  "is fully surrounded" is a global one you would otherwise have to prove per
  region.

**E18.5**
- *Nudge:* Memoize on the cell.
- *Structure:* `int[,] memo` where `memo[r,c]` is the longest increasing path
  **starting** at that cell.
- *Skeleton:*
  ```
  int Dfs(int r, int c) {
      if (memo[r,c] != 0) return memo[r,c];
      int best = 1;
      foreach (neighbour with grid[nr][nc] > grid[r][c])
          best = Math.Max(best, 1 + Dfs(nr, nc));
      return memo[r,c] = best;
  }
  ```
- *Why no visited set:* the path must be **strictly increasing**, so it can never
  revisit a cell — the ordering forbids cycles by itself. That is also why
  memoization is valid: the answer for a cell does not depend on how you arrived.
