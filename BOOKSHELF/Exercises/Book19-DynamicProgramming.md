# Exercises — Book 19: Dynamic Programming

**Reach for it when:** the same subproblem recurs; "how many ways"; "min/max over
choices".
**Always in this order:** brute-force recursion → add a memo → (optionally)
convert to a table → (optionally) shrink the space.
**The four questions:** what is the state? the recurrence? the base cases? the
fill order?

---

### E19.1 — Climbing Stairs
You can climb 1 or 2 steps at a time. How many distinct ways to reach step `n`?

- **Constraints:** `1 <= n <= 45`.
- **Target:** O(n) time, **O(1) space**.
- **Edge cases:** `n = 1`; `n = 2`; verify against Fibonacci for `n = 10` (89).
- **Before you code:** write the recurrence in one line. Then say why the naive
  recursion is O(2ⁿ) despite there being only `n` distinct subproblems.
- *(Stub exists: `DSA/15-DynamicProgramming-Basics`.)*

### E19.2 — House Robber
Given house values along a street, maximize the total you can take without
robbing two **adjacent** houses.

- **Constraints:** up to 100 houses; values 0–400.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** single house; two houses (take the larger); all zeroes; the
  optimal choice skips two in a row.
- **Before you code:** state the decision at each house in the form "the best from
  here is the max of ___ and ___".
- **Follow-up:** House Robber II — the houses are in a **circle**, so the first and
  last are adjacent. Solve it by calling your existing function **twice**. On what
  two ranges?

### E19.3 — Coin Change
Given coin denominations and an amount, return the **fewest** coins summing to it,
or `-1` if impossible.

- **Constraints:** up to 12 denominations; amount up to 10⁴; denominations are
  arbitrary.
- **Target:** O(amount · coins) time, O(amount) space.
- **Edge cases:** amount 0 (→ 0); no combination possible; a coin larger than the
  amount; **verify greedy fails** on `coins = [1,3,4], amount = 6`.
- **Before you code:** run greedy on that example by hand first and write down
  what it gives versus the true answer. That is the exercise.
- **Watch:** the "impossible" sentinel — do not add 1 to `int.MaxValue`.

### E19.4 — Longest Common Subsequence
Return the length of the longest subsequence common to two strings. A subsequence
need not be contiguous.

- **Constraints:** both strings up to 1000 characters.
- **Target:** O(n · m) time, O(min(n,m)) space after optimization.
- **Edge cases:** no common characters (0); identical strings; one string empty;
  one string a subsequence of the other.
- **Before you code:** the state is two-dimensional. Say what `dp[i, j]` **means**
  in words before writing the recurrence — a vague answer here is why 2D DP feels
  hard.

### E19.5 — Edit Distance
Return the minimum number of single-character insertions, deletions, or
substitutions to turn `word1` into `word2`.

- **Constraints:** both up to 500 characters.
- **Target:** O(n · m) time, O(min(n,m)) space after optimization.
- **Edge cases:** one string empty (answer is the other's length); identical
  strings (0); completely different strings of equal length.
- **Before you code:** three operations means three terms in the recurrence. Map
  each operation to which neighbouring cell it reads from — insert, delete, and
  substitute each correspond to exactly one.

---
---

# ⛔ STOP — hints below

---

**E19.1**
- *Recurrence:* `ways(n) = ways(n-1) + ways(n-2)`; `ways(0) = ways(1) = 1`.
- *Skeleton:* `int a = 1, b = 1; for (int i = 2; i <= n; i++) (a, b) = (b, a + b); return b;`
- *Why O(2ⁿ) naively:* the call tree branches twice at every level and each branch
  recomputes the same values — `ways(n-2)` is computed by both children.

**E19.2**
- *Recurrence:* `best(i) = max(best(i+1), nums[i] + best(i+2))` — skip this house,
  or take it and jump two.
- *Skeleton:* `int next1 = 0, next2 = 0; for (i = n-1 down to 0) { int cur = Math.Max(next1, nums[i] + next2); next2 = next1; next1 = cur; } return next1;`
- *Circle follow-up:* the first and last cannot both be taken, so run the linear
  solver on `nums[0..n-2]` and on `nums[1..n-1]` and take the larger. Handle
  `n == 1` separately.

**E19.3**
- *State:* `dp[a]` = fewest coins to make amount `a`.
- *Skeleton:*
  ```
  var dp = new int[amount + 1];
  Array.Fill(dp, amount + 1);              // sentinel: safely larger than any answer
  dp[0] = 0;
  for (int a = 1; a <= amount; a++)
      foreach (int c in coins)
          if (c <= a) dp[a] = Math.Min(dp[a], dp[a - c] + 1);
  return dp[amount] > amount ? -1 : dp[amount];
  ```
  Using `amount + 1` as the sentinel instead of `int.MaxValue` means `+ 1` never
  overflows.
- *Greedy on `[1,3,4]`, amount 6:* takes 4, then 1, then 1 → **3 coins**. Optimal
  is 3 + 3 → **2**.

**E19.4**
- *State:* `dp[i, j]` = length of the LCS of the first `i` characters of `a` and
  the first `j` of `b`.
- *Recurrence:*
  ```
  if (a[i-1] == b[j-1]) dp[i,j] = dp[i-1,j-1] + 1;
  else                  dp[i,j] = Math.Max(dp[i-1,j], dp[i,j-1]);
  ```
  Base row and column are 0 (empty prefix). Answer is `dp[n, m]`.
- *Space:* each row reads only the previous row → keep two rows.

**E19.5**
- *State:* `dp[i, j]` = edits to turn the first `i` characters of `word1` into the
  first `j` of `word2`.
- *Recurrence:*
  ```
  if (w1[i-1] == w2[j-1]) dp[i,j] = dp[i-1,j-1];              // free match
  else dp[i,j] = 1 + Math.Min(dp[i-1,j-1],                     // substitute
                     Math.Min(dp[i-1,j],                       // delete from w1
                              dp[i,j-1]));                     // insert into w1
  ```
  Base cases: `dp[i,0] = i` and `dp[0,j] = j` — turning a prefix into nothing costs
  one deletion per character.
