# Exercises — Book 01: HashSet

**Reach for it when:** presence, uniqueness, duplicates, visited, set algebra.
**The idiom:** `if (!seen.Add(x))` — one call does check-and-insert.

---

### E01.1 — Contains Duplicate
Given an integer array, return `true` if any value appears at least twice.

- **Constraints:** up to 10⁵ elements; values may be negative.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** empty array; single element; all identical; all distinct.
- **Before you code:** what is the naive version, and what is its complexity?
  Name it out loud before you write the fast one.
- *(Stub exists: `DSA/01-Arrays` — check your question list.)*

### E01.2 — Intersection of Two Arrays
Given two integer arrays, return an array of their common elements. Each element
in the result must be unique; order does not matter.

- **Constraints:** arrays up to 10⁵ each.
- **Target:** O(n + m) time, O(min(n, m)) space.
- **Edge cases:** no overlap; one array empty; duplicates *within* a single input
  array; identical arrays.
- **Before you code:** there is a one-line BCL answer and a manual answer. Name
  both, and say what the one-liner costs.

### E01.3 — Happy Number
Repeatedly replace a positive integer with the sum of the squares of its digits.
Return `true` if this eventually reaches 1, `false` if it loops forever.

- **Constraints:** `1 <= n <= 2^31 - 1`.
- **Target:** O(log n) time per step, O(log n) space.
- **Edge cases:** `n = 1` (already happy); `n = 7`; `n = 2` (cycles).
- **Before you code:** how do you *know* it loops forever rather than running
  forever? What are you maintaining to detect that?
- **Follow-up:** solve it in O(1) space. (Different book — which one?)

### E01.4 — Longest Consecutive Sequence
Given an **unsorted** integer array, return the length of the longest run of
consecutive integers present in it.

Example: `[100, 4, 200, 1, 3, 2]` → `4` (the run `1,2,3,4`).

- **Constraints:** up to 10⁵ elements. **Must run in O(n)** — sorting is not
  allowed.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** empty; all duplicates; already consecutive; negatives.
- **Before you code:** the obvious set-based version walks a run from *every*
  element, which is O(n²). What one check makes each run get walked exactly once?

### E01.5 — Valid Sudoku
Given a 9×9 board (digits `1`–`9` or `.`), determine whether it is valid: no
duplicate digit in any row, column, or 3×3 sub-box. The board need not be
solvable.

- **Constraints:** fixed 9×9.
- **Target:** O(1) — the board is fixed size — but structure it as one pass.
- **Edge cases:** fully empty board (valid); duplicate only within a sub-box but
  not in its row or column.
- **Before you code:** how many sets do you need, and how do you compute the
  sub-box index from `(row, col)`?

---
---

# ⛔ STOP — hints below

Take **one rung at a time.** Try, fail, try again, fail, try again — *then* read.

---

**E01.1**
- *Nudge:* You do not need two passes, and you do not need counts.
- *Structure:* One `HashSet<int>`, filled as you scan.
- *Skeleton:* `foreach (var n in nums) if (!seen.Add(n)) return true; return false;`

**E01.2**
- *Nudge:* This is set algebra, and .NET has the operations built in.
- *Structure:* Build a `HashSet` from the smaller array; probe with the larger.
- *Skeleton:* `a.ToHashSet().Intersect(b)` — or `var s = new HashSet<int>(a); s.IntersectWith(b);`
  Note `IntersectWith` **mutates** the receiver.

**E01.3**
- *Nudge:* "Loops forever" means you revisit a value you have already produced.
- *Structure:* `HashSet<int>` of every sum seen so far.
- *Skeleton:* `while (n != 1 && seen.Add(n)) n = SumOfSquaredDigits(n); return n == 1;`
- *Follow-up rung:* the O(1)-space version is Floyd's fast/slow — Book 06 applies
  to any function-iteration cycle, not just linked lists.

**E01.4**
- *Nudge:* Only start counting a run from its **beginning**.
- *Structure:* One `HashSet<int>` of all values.
- *Skeleton:*
  ```
  if (set.Contains(n - 1)) continue;   // n is NOT the start of a run — skip
  int len = 1; while (set.Contains(n + len)) len++;
  ```
  That guard is the whole O(n) argument: each run is walked once, from its start.

**E01.5**
- *Nudge:* Three families of constraint, nine of each.
- *Structure:* `HashSet<char>[9]` for rows, another for columns, another for
  boxes — 27 sets. Or one `HashSet<string>` of encoded keys like `$"r{r}:{d}"`.
- *Skeleton:* box index is `(r / 3) * 3 + (c / 3)`. One pass over 81 cells,
  `Add` returning false anywhere means invalid.
