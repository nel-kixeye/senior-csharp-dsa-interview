# Exercises — Book 14: Backtracking

**Reach for it when:** "generate all …", constraints, small n (≤ ~20).
**The skeleton:** choose → explore → **undo**.
**The universal bug:** `results.Add(path)` stores a reference you are about to
mutate. Always `results.Add(new List<T>(path))`.

---

### E14.1 — Subsets
Return all possible subsets (the power set) of an array of **distinct** integers,
in any order.

- **Constraints:** up to 10 elements.
- **Target:** O(n · 2ⁿ) time, O(n) space excluding output.
- **Edge cases:** empty input (result is `[[]]`); single element; verify you
  produce exactly 2ⁿ subsets.
- **Before you code:** at each index you make one binary decision. Name it. Then
  say how many leaves the decision tree has.
- **Follow-up:** solve it again with a bitmask loop and no recursion (Book 25).

### E14.2 — Permutations
Return all permutations of an array of distinct integers.

- **Constraints:** up to 6 elements.
- **Target:** O(n · n!) time.
- **Edge cases:** single element; empty; verify you produce exactly n!
  permutations with no duplicates.
- **Before you code:** subsets used a *start index*; permutations need something
  different. Which, and why does the start index not work here?

### E14.3 — Combination Sum
Given distinct candidates and a target, return all unique combinations summing to
the target. **The same candidate may be reused unlimited times.**

- **Constraints:** up to 30 candidates, all positive; target up to 40.
- **Edge cases:** no valid combination; a candidate equal to the target; a
  candidate larger than the target; verify `[2,2,3]` and `[3,2,2]` are not both
  returned.
- **Before you code:** reuse is allowed, so what index do you pass to the
  recursive call — `i` or `i + 1`? Say which and why the other one is wrong.
- **Prune:** what lets you stop exploring a branch early?

### E14.4 — Word Search
Given an `m × n` grid of characters and a word, return whether the word exists as
a path of horizontally or vertically adjacent cells. A cell may not be reused
within a single word.

- **Constraints:** grid up to 6 × 6; word up to 15 characters.
- **Target:** O(m · n · 4^L) worst case.
- **Edge cases:** word longer than the grid; single-character word; the word
  requires revisiting a cell (must fail); word not present at all.
- **Before you code:** "may not be reused **within a single word**" — how do you
  mark a cell as in-use, and critically, when do you *unmark* it?

### E14.5 — N-Queens
Place `n` queens on an `n × n` board so no two attack each other. Return all
distinct solutions as board layouts.

- **Constraints:** `1 <= n <= 9`.
- **Target:** O(n!) with pruning.
- **Edge cases:** `n = 1` (one solution); `n = 2` and `n = 3` (no solutions);
  `n = 8` (92 solutions — a good self-check).
- **Before you code:** you place one queen per row, so rows never conflict. What
  are the **three** remaining conflict checks, and how do you make each O(1)
  instead of scanning the board?

---
---

# ⛔ STOP — hints below

---

**E14.1**
- *Nudge:* Take it, or skip it.
- *Skeleton:*
  ```
  void Go(int i) {
      if (i == nums.Length) { res.Add(new List<int>(cur)); return; }
      Go(i + 1);                                              // skip
      cur.Add(nums[i]); Go(i + 1); cur.RemoveAt(cur.Count - 1); // take, then UNDO
  }
  ```
- *Bitmask rung:* `for (int mask = 0; mask < (1 << n); mask++)`, include element
  `i` when `(mask & (1 << i)) != 0`.

**E14.2**
- *Nudge:* Order matters, so every unused element is a candidate at every step.
- *Structure:* a `bool[] used` array, not a start index.
- *Skeleton:* loop `i` from 0 to n−1 each call; `if (used[i]) continue;` then set
  `used[i] = true`, add, recurse, and undo both.
- *Why not a start index:* a start index forbids going backwards, which is exactly
  what you need for permutations — `[2,1]` requires revisiting index 0 after 1.

**E14.3**
- *Nudge:* Reuse means you do not advance past the current candidate.
- *Skeleton:* pass `i` (not `i + 1`) to the recursive call so the same candidate
  can be chosen again. Passing `i + 1` would give the "use each at most once"
  variant.
- *Prune:* sort the candidates, then `if (candidates[i] > remaining) break;` —
  everything after is larger and cannot fit either.
- *Duplicate control:* the start index is what prevents `[2,2,3]` and `[3,2,2]`
  both appearing.

**E14.4**
- *Nudge:* Mutate the grid in place as your visited marker — the restore *is* the
  backtrack.
- *Skeleton:*
  ```
  bool Dfs(int r, int c, int k) {
      if (k == word.Length) return true;
      if (out of bounds || grid[r][c] != word[k]) return false;
      char saved = grid[r][c]; grid[r][c] = '#';           // mark
      bool found = Dfs(r+1,c,k+1) || Dfs(r-1,c,k+1) || Dfs(r,c+1,k+1) || Dfs(r,c-1,k+1);
      grid[r][c] = saved;                                   // UNMARK — always
      return found;
  }
  ```
  Unmark on **every** exit path, not just failure — otherwise a later starting
  cell sees a corrupted grid.

**E14.5**
- *Nudge:* One queen per row; track which columns and diagonals are taken.
- *Structure:* three `bool[]` arrays — `cols[n]`, `diag1[2n]` indexed by `r + c`,
  `diag2[2n]` indexed by `r - c + n`.
- *Skeleton:* recurse on the row. For each column, skip if any of the three flags
  is set; otherwise set all three, place, recurse, then clear all three.
- *Why those indices:* every cell on a `↘` diagonal shares `r + c`; every cell on
  a `↙` diagonal shares `r - c` (offset by `n` to keep it non-negative). That
  turns an O(n) scan into O(1).
