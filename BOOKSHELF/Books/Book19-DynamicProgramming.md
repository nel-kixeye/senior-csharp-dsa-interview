# Book 19 — Dynamic Programming

> The book of *"I am solving the same smaller problem over and over."*

## 1. What problem does this book solve?

Eliminating redundant computation in a recursion whose subproblems **overlap**.
That is all DP is. It is not a mathematical technique; it is caching applied to
recursion, plus the observation that if you can cache it, you can often also
build it bottom-up and drop the recursion entirely.

Two conditions, both required:

- **Overlapping subproblems** — the same sub-question arises many times.
- **Optimal substructure** — the best answer is built from best answers to
  subproblems.

## 2. Signals

- "**How many ways** ...?" (with n large — small n is backtracking)
- "**Maximum / minimum** ... subject to choices"
- "Can you reach / make / partition ...?" (boolean DP)
- "Longest / shortest ... **subsequence**" (not subarray — that is often a
  window)
- "Minimum cost / effort / edits to ..."
- Choices at each step where the choices **interact**
- "Fibonacci-like" — the answer for n depends on n-1 and n-2
- Grid path counting / minimum path sum
- Knapsack shapes: "with a capacity limit, maximize value"
- Coin change, stairs, house robber, edit distance, LCS

**The self-check that actually works:** write the brute-force recursion first.
Then ask — *do two different branches ever call this function with the same
arguments?* If yes, it is DP, and the arguments that repeat **are your state**.

## 3. The naive instinct

```csharp
long Fib(int n) => n < 2 ? n : Fib(n - 1) + Fib(n - 2);          // O(2^n)

int Rob(int[] h, int i)                                           // O(2^n)
    => i >= h.Length ? 0 : Math.Max(Rob(h, i + 1), h[i] + Rob(h, i + 2));
```

## 4. Why that is inferior

`Fib(50)` makes about 2^50 calls but only has **51 distinct** subproblems. The
work is almost entirely recomputation. A memo turns O(2^n) into O(n) — not by
being clever, but by refusing to answer the same question twice.

This is the whole idea. Everything else in DP is bookkeeping.

## 5. What to recognize

**Three forms, same algorithm.** Write them in this order when you are stuck:

```csharp
// (1) Brute-force recursion — get this right first
int Rob(int i) => i >= n ? 0 : Math.Max(Rob(i + 1), h[i] + Rob(i + 2));

// (2) Top-down: add a memo. The recursion is unchanged.
var memo = new Dictionary<int, int>();
int Rob(int i)
{
    if (i >= n) return 0;
    if (memo.TryGetValue(i, out int cached)) return cached;
    return memo[i] = Math.Max(Rob(i + 1), h[i] + Rob(i + 2));
}

// (3) Bottom-up: fill a table in dependency order
var dp = new int[n + 2];
for (int i = n - 1; i >= 0; i--)
    dp[i] = Math.Max(dp[i + 1], h[i] + dp[i + 2]);
return dp[0];

// (4) Space-optimized: only the last two values are ever read
int next1 = 0, next2 = 0;
for (int i = n - 1; i >= 0; i--)
{
    int cur = Math.Max(next1, h[i] + next2);
    next2 = next1; next1 = cur;
}
return next1;
```

**Go top-down first in an interview.** It follows directly from the brute force,
the state is obvious, and you do not have to reason about fill order. Convert to
bottom-up only if asked or if recursion depth is a risk.

**The four questions that define any DP:**

1. **What is the state?** The minimal set of arguments that determines the
   answer. (Here: the index `i`.)
2. **What is the recurrence?** How the answer at a state is built from others.
3. **What are the base cases?**
4. **What order fills the table?** (Bottom-up only; top-down handles it for you.)

**Classic state shapes worth recognizing on sight:**

| Shape | State | Example |
|---|---|---|
| Linear | `dp[i]` | House Robber, Climbing Stairs |
| Two sequences | `dp[i, j]` | Edit Distance, LCS |
| Knapsack | `dp[i, capacity]` | Subset Sum, Coin Change |
| Interval | `dp[i, j]` over ranges | Burst Balloons, Matrix Chain |
| Grid | `dp[r, c]` | Unique Paths, Min Path Sum |
| Bitmask | `dp[mask]` | TSP, assignment (n ≤ 20) (25) |
| State machine | `dp[i, state]` | Stock problems with cooldown |

## 6. Complexity

**time = (number of states) x (work per state)**

| Problem | States | Per state | Total |
|---|---|---|---|
| Fibonacci / stairs | O(n) | O(1) | O(n) |
| House Robber | O(n) | O(1) | O(n) |
| Coin Change | O(n * amount) | O(coins) | O(n * amount) |
| Edit Distance / LCS | O(n * m) | O(1) | O(n * m) |
| 0/1 Knapsack | O(n * W) | O(1) | O(n * W) |
| LIS (DP) | O(n) | O(n) | O(n^2) — or O(n log n) with binary search (12) |
| Bitmask DP | O(2^n * n) | O(n) | O(2^n * n^2) |

Space is the table, often reducible to one or two rows when `dp[i]` depends only
on `dp[i-1]`. Mention that reduction in interviews; it is a reliable follow-up
question.

Knapsack's O(n * W) is **pseudo-polynomial** — polynomial in the *value* of W,
exponential in its bit length. Worth naming if asked.

## 7. C# specifics

```csharp
// Memo keyed on multiple values: tuples work directly
var memo = new Dictionary<(int i, int j), int>();

// 2D table
var dp = new int[n + 1, m + 1];

// Initializing to "impossible"
var dp2 = new int[amount + 1];
Array.Fill(dp2, int.MaxValue);
dp2[0] = 0;
// then guard: if (dp2[i - coin] != int.MaxValue) ...   <-- avoid overflow on +1

// Booleans default to false, ints to 0 — often exactly the base case you want
var reachable = new bool[n + 1];
reachable[0] = true;
```

Use `int.MaxValue / 2` as the "infinity" sentinel if you will add to it —
`int.MaxValue + 1` silently wraps negative, which produces a plausible wrong
answer rather than a crash.

For top-down over large state spaces, watch recursion depth (13).

## 8. Common mistakes

1. **Jumping straight to a table** without writing the recursion. You will pick
   the wrong state.
2. **Incomplete state** — missing a dimension the answer actually depends on.
   The symptom is a solution that is right on small cases and wrong on larger
   ones.
3. **Wrong fill order** bottom-up: reading a cell that is not computed yet.
4. **Overflow on sentinel arithmetic** (`int.MaxValue + 1`).
5. **Off-by-one on table size** — usually `n + 1` with index 0 meaning "empty."
6. **0/1 vs unbounded knapsack loop direction.** Iterating capacity *ascending*
   allows reusing an item (unbounded); *descending* uses each item once (0/1).
   Same code, opposite meaning — this is the single most confusing DP detail.
7. **Memoizing on a mutable key** (a `List` used as a dictionary key).
8. **Using DP when greedy is provably correct** — more code, more risk (20).
9. **Backtracking when the problem only asks how many** (14).

## 9. Correct-book problems

**Linear:** Climbing Stairs, House Robber I/II, Min Cost Climbing Stairs,
Decode Ways, Word Break, Jump Game II, Maximum Subarray (Kadane).

**Two sequences:** Longest Common Subsequence, Edit Distance, Distinct
Subsequences, Interleaving String, Regular Expression Matching.

**Knapsack:** Coin Change I/II, Partition Equal Subset Sum, Target Sum,
Combination Sum IV, Last Stone Weight II.

**Grid:** Unique Paths I/II, Minimum Path Sum, Maximal Square, Triangle,
Dungeon Game.

**Interval:** Burst Balloons, Longest Palindromic Substring/Subsequence,
Matrix Chain Multiplication.

**State machine:** Best Time to Buy and Sell Stock with Cooldown / Fee / at
most K transactions.

**Other:** LIS (and its O(n log n) form), Longest Increasing Path in a Matrix
(DFS + memo), Perfect Squares.

## 10. Where DP looks right but is wrong

- **Greedy is provably correct** — activity selection, Huffman, and many
  interval problems. DP works but is heavier (20).
- **The problem asks you to *list* solutions** → backtracking (14). DP counts
  and optimizes; it does not enumerate.
- **No overlapping subproblems** — merge sort recurses but never repeats a
  subproblem; caching buys nothing.
- **Contiguous subarray with a simple condition** → sliding window (10) or
  prefix sums (11), both simpler and often O(1) space.
- **State space is astronomically large** — if the state does not compress, DP
  will not save you.
- **A closed-form formula exists** — combinatorics beats a table (26).
- **The "state" needs the whole history** — that is a sign the decomposition is
  wrong, not that you need a bigger key.

---

## Production Lens

The production form of DP is **memoization**, and it is everywhere: caching
expensive pure functions, `Lazy<T>`, `IMemoryCache`, incremental build systems,
diffing algorithms (edit distance powers `git diff` and every text-diff UI you
have used).

The production questions DP does not ask but you must: **cache invalidation,
bounded size, and eviction.** A `Dictionary` memo that lives for the process
lifetime is a memory leak. `MemoryCache` with a size limit and expiry is the
grown-up version.

And the classic senior instinct: before hand-rolling a memo, check whether the
function is pure and whether the framework already caches it.

**Related:** [[Book13-Recursion]], [[Book02-Dictionary]], [[Book20-Greedy]],
[[Book14-Backtracking]], [[Book25-BitManipulation]].
