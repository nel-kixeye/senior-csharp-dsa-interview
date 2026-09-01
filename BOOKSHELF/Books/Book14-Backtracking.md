# Book 14 — Backtracking

> The book of *"choose, explore, undo."*

## 1. What problem does this book solve?

Systematically enumerating a search space of **decisions**, abandoning a branch
the moment it cannot lead to a valid answer. It is DFS over a decision tree,
with state mutation on the way down and restoration on the way up.

## 2. Signals

- "Generate **all** ..." — subsets, permutations, combinations, arrangements
- "Find all possible ..." / "list every ..."
- "How many ways" **and n is small** (n ≤ ~20) — if n is large, it is DP (19)
- "Place / assign / arrange subject to constraints"
- Puzzles: sudoku, n-queens, crosswords, word search
- "Partition into groups such that ..."
- "Valid sequences" where validity is checked incrementally
- Constraint satisfaction of any kind

**The constraint tell:** exponential answers require exponential time, so small
input bounds (n ≤ 20 for subsets, n ≤ 10 for permutations) are a strong hint
that enumeration is intended.

**The distinguishing tell vs DP:** backtracking **lists** the solutions; DP
**counts or optimizes** over them. "Return all subsets that sum to K" is
backtracking. "How many subsets sum to K" is DP.

## 3. The naive instinct

Nested loops of unknown depth — which cannot be written:

```csharp
// "All 3-element combinations" — fine
for (int i = 0; i < n; i++)
  for (int j = i+1; j < n; j++)
    for (int k = j+1; k < n; k++) ...

// "All k-element combinations" for variable k — impossible with fixed nesting
```

Or generating everything and filtering at the end, which explodes.

## 4. Why that is inferior

Fixed nesting cannot express variable depth. Recursion supplies the depth
dynamically.

The bigger win is **pruning**. Generate-then-filter explores the entire space;
backtracking abandons a branch as soon as it is provably dead. In n-queens,
checking conflicts at placement time cuts the space from 8^8 ≈ 16.7 million to a
few thousand — three orders of magnitude, from one `if`.

## 5. What to recognize

The universal skeleton. Learn it once; every problem is a variation:

```csharp
void Backtrack(State state, List<Choice> path)
{
    if (IsComplete(state)) { results.Add(new List<Choice>(path)); return; }  // copy!

    foreach (var choice in Candidates(state))
    {
        if (!IsValid(state, choice)) continue;   // prune

        Apply(state, choice); path.Add(choice);  // CHOOSE
        Backtrack(state, path);                  // EXPLORE
        path.RemoveAt(path.Count - 1); Undo(state, choice);   // UNDO
    }
}
```

The three canonical shapes differ only in `Candidates`:

```csharp
// SUBSETS — at each index, take it or skip it
void Subsets(int i)
{
    if (i == nums.Length) { res.Add(new List<int>(cur)); return; }
    Subsets(i + 1);                                   // skip
    cur.Add(nums[i]); Subsets(i + 1); cur.RemoveAt(cur.Count - 1);   // take
}

// COMBINATIONS — start index prevents reordering the same set
void Combine(int start)
{
    if (cur.Count == k) { res.Add(new List<int>(cur)); return; }
    for (int i = start; i < n; i++)
    { cur.Add(nums[i]); Combine(i + 1); cur.RemoveAt(cur.Count - 1); }
}

// PERMUTATIONS — a used[] flag, because order matters
void Permute()
{
    if (cur.Count == n) { res.Add(new List<int>(cur)); return; }
    for (int i = 0; i < n; i++)
    {
        if (used[i]) continue;
        used[i] = true;  cur.Add(nums[i]);
        Permute();
        cur.RemoveAt(cur.Count - 1);  used[i] = false;
    }
}
```

**Handling duplicates**: sort first, then skip a candidate when
`i > start && nums[i] == nums[i - 1]`. That one line turns "Subsets" into
"Subsets II" and is worth memorizing verbatim.

## 6. Complexity

| Problem | Time | Space (excl. output) |
|---|---|---|
| Subsets | O(n * 2^n) | O(n) |
| Permutations | O(n * n!) | O(n) |
| Combinations C(n,k) | O(k * C(n,k)) | O(k) |
| N-Queens | O(n!) with pruning | O(n) |
| Word Search (grid) | O(r * c * 4^L) | O(L) |

The extra factor of n or k is the cost of **copying** each completed path into
the results. Space excluding output is O(depth) for the call stack plus the
current path.

Pruning does not change the worst case, but it routinely changes the practical
runtime by orders of magnitude.

## 7. C# specifics

```csharp
// Copy on record — the single most common backtracking bug
res.Add(new List<int>(cur));       // correct
res.Add(cur);                       // WRONG: stores a reference you will mutate

// Fast validity tracking for n-queens via sets or bitmasks (25)
var cols = new bool[n];
var diag1 = new bool[2 * n];   // r + c
var diag2 = new bool[2 * n];   // r - c + n

// StringBuilder for path building, then ToString() at the leaf (30)
sb.Append(c);  Backtrack();  sb.Length--;      // Length-- is the undo
```

`sb.Length--` as the undo for `sb.Append(c)` is a neat idiom worth knowing.

For grid problems, mutate the grid in place as your visited marker and restore
it on the way out — cheaper than a HashSet, and the restore *is* the backtrack:

```csharp
char saved = grid[r][c];
grid[r][c] = '#';
... recurse ...
grid[r][c] = saved;
```

## 8. Common mistakes

1. **Adding the path by reference** instead of copying. Every result ends up
   empty or identical.
2. **Forgetting to undo** — state leaks into sibling branches.
3. **Undoing in the wrong order** — mirror the choose step exactly, in reverse.
4. **No pruning**, turning a tractable search into a timeout.
5. **Duplicate results** from unsorted input with repeated values — sort and
   apply the skip rule.
6. **Using a start index for permutations** (order matters, so you need `used[]`)
   or a `used[]` array for combinations (order does not matter, so you need a
   start index). Mixing these up is the classic conceptual error.
7. **Mutating the shared collection during iteration.**
8. **Recursing when it is really a counting problem** → DP (19).

## 9. Correct-book problems

- Subsets; Subsets II (duplicates)
- Permutations; Permutations II
- Combinations; Combination Sum I / II / III
- Generate Parentheses — prune on open/close counts
- Letter Combinations of a Phone Number
- Word Search — grid DFS with in-place marking
- N-Queens; N-Queens II
- Sudoku Solver
- Palindrome Partitioning
- Restore IP Addresses
- Beautiful Arrangement
- Path Sum II (all root-to-leaf paths hitting a target)

## 10. Where Backtracking looks right but is wrong

- **"How many ways ...?" with large n** → DP (19). Enumerating 2^100 subsets to
  count them is not a plan.
- **"Maximum / minimum value achievable"** → DP or greedy. You rarely need to
  see every solution to know the best one.
- **"Does any solution exist?"** — you may be able to stop at the first, or
  there may be a direct constructive answer.
- **Shortest path** → BFS (17). DFS enumerates paths; BFS finds the shortest.
- **The choices are independent** — if each decision does not constrain the
  others, it is a product, not a search.
- **n is large and there is structure to exploit** — greedy or DP will use it;
  brute-force enumeration will not.

---

## Production Lens

Explicit backtracking in production is rare — it shows up in solvers,
schedulers, dependency resolvers, and query planners. When you meet one of
those, look hard for an existing library or a constraint solver (Z3, OR-Tools)
before hand-rolling; real constraint problems need propagation and heuristics
that a hand-written DFS will not have.

Where it *does* appear directly: NuGet-style version resolution, permission
evaluation over hierarchies, and regex backtracking — the last of which is worth
knowing as a hazard. Catastrophic regex backtracking (ReDoS) is exactly this
algorithm running exponentially on hostile input. Set
`RegexOptions.NonBacktracking` or a `matchTimeout` on any regex touching user
data.

**Related:** [[Book13-Recursion]], [[Book18-DFS]],
[[Book19-DynamicProgramming]], [[Book25-BitManipulation]].
