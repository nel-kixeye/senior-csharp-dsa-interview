# Exercises — Book 20: Greedy

**Reach for it when:** a locally optimal choice is provably safe.
**The discipline:** state the **exchange argument** out loud before writing code —
*"given any optimal solution, I can swap in my greedy choice without making it
worse."* If you cannot, look for a counterexample; if you find one, it is DP.

---

### E20.1 — Best Time to Buy and Sell Stock II
Given daily prices, maximize profit. You may complete as many transactions as you
like, but must sell before buying again.

- **Constraints:** up to 3·10⁴ prices.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** strictly decreasing prices (profit 0); strictly increasing (buy
  day 1, sell last — same total); single day; all equal prices.
- **Before you code:** the answer is startlingly short. State the greedy rule in
  one sentence, then justify why capturing every upward step is equivalent to
  buying at valleys and selling at peaks.

### E20.2 — Jump Game
Each element is the maximum jump length from that position. Starting at index 0,
determine whether you can reach the last index.

- **Constraints:** up to 10⁴ elements; values 0–10⁵.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** single element (true); a `0` at the last index (fine); a `0`
  before the end that cannot be jumped over; `[0]` versus `[0, 1]`.
- **Before you code:** you do not need to try every jump. What single number do
  you maintain, and what makes the answer false?

### E20.3 — Gas Station
There are `n` stations in a circle with `gas[i]` fuel and `cost[i]` to reach the
next. Starting with an empty tank, return the index you must start at to complete
the circuit, or `-1` if impossible. The answer is guaranteed unique if it exists.

- **Constraints:** up to 10⁵ stations.
- **Target:** O(n) time, O(1) space — **one pass**, no simulation from each start.
- **Edge cases:** total gas less than total cost (−1); single station; the answer
  is index 0; the answer is the last index.
- **Before you code:** two insights. First: when is the answer definitely `-1`?
  Second: if you run out of fuel between `start` and `i`, what do you know about
  every index in between?

### E20.4 — Non-overlapping Intervals
Return the **minimum number of intervals to remove** so that the rest do not
overlap.

- **Constraints:** up to 10⁵ intervals.
- **Target:** O(n log n) time.
- **Edge cases:** no overlaps (0); all identical; intervals that merely touch
  (`[1,2]` and `[2,3]` — not overlapping); one interval containing all others.
- **Before you code:** minimizing removals is the same as **maximizing keeps**.
  Then: sort by what? Justify the key with the exchange argument — and say why the
  intuitive key is wrong.

### E20.5 — Partition Labels
Partition a string into as many parts as possible so that each letter appears in
at most one part. Return the part lengths in order.

- **Constraints:** up to 500 lowercase characters.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** all identical characters (one part); all distinct (n parts of
  length 1); a character appearing at both the very start and the very end (forces
  one part).
- **Before you code:** what do you need to know about each character before you
  can start partitioning? That precomputation names the structure.

---
---

# ⛔ STOP — hints below

---

**E20.1**
- *Rule:* take every positive day-over-day difference.
- *Skeleton:* `for (i = 1..n-1) profit += Math.Max(0, prices[i] - prices[i-1]);`
- *Why it is equivalent:* a rise from a valley to a peak equals the sum of the
  consecutive rises along the way, and downward steps contribute nothing. So
  summing the ups captures every valley-to-peak trade without finding them.

**E20.2**
- *Maintain:* the furthest index reachable so far.
- *Skeleton:*
  ```
  int reach = 0;
  for (int i = 0; i < n; i++) {
      if (i > reach) return false;                 // this index is unreachable
      reach = Math.Max(reach, i + nums[i]);
  }
  return true;
  ```
  The failure condition is arriving at an index beyond your reach — not seeing a
  `0`, which is a common wrong guess (a `0` at the final index is harmless).

**E20.3**
- *Insight 1:* if `sum(gas) < sum(cost)`, no start works — return −1.
- *Insight 2:* if you start at `start` and run dry at station `i`, then **no index
  between `start` and `i` works either** — each of them starts with less or equal
  fuel at every subsequent point. So jump `start` to `i + 1` and reset the tank.
- *Skeleton:*
  ```
  int total = 0, tank = 0, start = 0;
  for (int i = 0; i < n; i++) {
      int diff = gas[i] - cost[i];
      total += diff; tank += diff;
      if (tank < 0) { start = i + 1; tank = 0; }
  }
  return total < 0 ? -1 : start;
  ```
  One pass, no restart simulation.

**E20.4**
- *Nudge:* Sort by **end**, keep greedily.
- *Skeleton:*
  ```
  Array.Sort(intervals, (a, b) => a[1].CompareTo(b[1]));
  int kept = 0, lastEnd = int.MinValue;
  foreach (var iv in intervals)
      if (iv[0] >= lastEnd) { kept++; lastEnd = iv[1]; }
  return intervals.Length - kept;
  ```
- *Exchange argument:* the earliest-ending interval leaves the maximum room for
  everything after it, so swapping any optimal solution's first interval for it
  cannot reduce the count. Sorting by **start** fails because one long early
  interval can block many short ones.
- *`>=` not `>`:* touching intervals do not overlap.

**E20.5**
- *Precompute:* the **last index** of every character — `int[26]`.
- *Skeleton:*
  ```
  int start = 0, end = 0;
  for (int i = 0; i < s.Length; i++) {
      end = Math.Max(end, last[s[i] - 'a']);
      if (i == end) { result.Add(end - start + 1); start = i + 1; }
  }
  ```
  The current part cannot close before the last occurrence of every character seen
  so far. When the scan index catches up to that boundary, the part is complete.
