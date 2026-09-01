# Book 20 — Greedy

> The book of *"take the best option now — and prove that is safe."*

## 1. What problem does this book solve?

Building an optimal solution by making the locally best choice at each step,
never reconsidering. When it works, it turns an exponential search into a single
sorted pass. When it does not work, it produces a confident wrong answer.

Greedy is the only book on this shelf where **the proof is part of the
technique**.

## 2. Signals

- "Maximum number of non-overlapping ..." → sort by **end** time
- "Minimum number of ... needed to cover"
- "Schedule as many as possible"
- Interval problems generally (22)
- "Always pick the largest / smallest / cheapest next"
- "Can you reach the end?" (Jump Game — track the furthest reachable)
- Huffman coding, minimum spanning tree
- "Assign / match to minimize waste"
- The problem yields to **sorting followed by one pass**

**The precondition — the exchange argument.** Greedy is valid when you can argue:
*given any optimal solution, I can swap in my greedy choice without making it
worse.* If you cannot make that argument, do not trust greedy.

**The counter-signal:** if a locally good choice can force a bad future — coin
change with denominations like `{1, 3, 4}` — greedy fails and you need DP (19).

## 3. The naive instinct

Two opposite failures again.

**Trusting greedy without checking.** Coin change with `{1, 3, 4}` for amount 6:
greedy takes 4, then 1, then 1 → three coins. Optimal is 3 + 3 → two. The code
looks right, runs fast, and is wrong.

**Distrusting greedy and writing DP** for interval scheduling, where an O(n log
n) sort plus one pass is provably optimal — turning ten lines into fifty.

## 4. Why the distinction matters

Greedy: O(n log n) typically (the sort dominates), O(1) extra space.
DP: O(n * W) or worse, plus a table.

When greedy is valid it is dramatically simpler and faster. When it is not, it
is silently incorrect. So the discipline is: **state the exchange argument out
loud before writing the code.** In an interview, saying "greedy works here
because taking the earliest-ending interval never eliminates a better option"
is worth as much as the implementation.

## 5. What to recognize

**The canonical greedy: interval scheduling.** Sort by end time, not start:

```csharp
// Maximum number of non-overlapping intervals
Array.Sort(intervals, (a, b) => a[1].CompareTo(b[1]));   // by END
int count = 0, lastEnd = int.MinValue;
foreach (var iv in intervals)
    if (iv[0] >= lastEnd) { count++; lastEnd = iv[1]; }
```

*Why end time?* The interval that finishes earliest leaves the most room for
everything after it. Sorting by start, or by duration, is the intuitive choice
and it is wrong — a good thing to have burned in, because it is a common trap.

**Jump Game** — track the furthest reachable index:

```csharp
int reach = 0;
for (int i = 0; i < nums.Length; i++)
{
    if (i > reach) return false;                  // cannot even get here
    reach = Math.Max(reach, i + nums[i]);
}
return true;
```

**Greedy with a heap** — when "best next" changes as you go (07):

```csharp
// Minimum meeting rooms: reuse the room that frees up soonest
Array.Sort(intervals, (a, b) => a[0].CompareTo(b[0]));    // by start
var endTimes = new PriorityQueue<int, int>();             // min-heap of end times
foreach (var iv in intervals)
{
    if (endTimes.Count > 0 && endTimes.Peek() <= iv[0]) endTimes.Dequeue();
    endTimes.Enqueue(iv[1], iv[1]);
}
return endTimes.Count;
```

**The three greedy sort keys**, worth memorizing:

| Goal | Sort by |
|---|---|
| Max count of non-overlapping | **end** ascending |
| Merge overlapping intervals | **start** ascending |
| Min resources for all intervals | **start**, plus a min-heap of ends |

## 6. Complexity

| Pattern | Time | Space |
|---|---|---|
| Sort + single pass | O(n log n) | O(1) |
| Single pass, no sort | O(n) | O(1) |
| Greedy + heap | O(n log n) | O(n) |

Greedy is nearly always the cheapest correct approach *when it is correct*. The
sort usually dominates.

## 7. C# specifics

```csharp
Array.Sort(intervals, (a, b) => a[1].CompareTo(b[1]));
var sorted = items.OrderBy(x => x.End).ToArray();          // stable, allocates

// Compare by one key then another
Array.Sort(jobs, (a, b) => a.Deadline != b.Deadline
                            ? a.Deadline.CompareTo(b.Deadline)
                            : b.Profit.CompareTo(a.Profit));
```

Do **not** write `(a, b) => a.Value - b.Value` as a comparator — it overflows for
large or negative values and returns a wrong sign. Use `CompareTo`. This is a
real bug that survives code review because it usually works.

`Array.Sort` is introsort and **unstable**; LINQ's `OrderBy` is **stable**. When
ties must preserve input order, that difference is the answer.

## 8. Common mistakes

1. **Assuming greedy works without an argument.** The defining mistake.
2. **Sorting by the wrong key** — start instead of end for interval scheduling.
3. **Subtraction comparators** that overflow.
4. **Greedy on coin change** with arbitrary denominations. It works for
   `{1,5,10,25}` (canonical systems) and fails in general.
5. **Not handling ties** deterministically.
6. **Local optimum where the problem needs global** — 0/1 knapsack by
   value/weight ratio is greedy and wrong; the *fractional* version is greedy
   and right. Knowing which variant you have is the whole game.
7. **Reconsidering earlier choices** — that is no longer greedy; you have
   drifted into DP or backtracking.

## 9. Correct-book problems

- Non-overlapping Intervals; Minimum Number of Arrows to Burst Balloons
- Merge Intervals; Insert Interval (22)
- Meeting Rooms II (greedy + heap)
- Jump Game I / II
- Gas Station — single pass with a running deficit
- Task Scheduler — always schedule the most frequent remaining (07)
- Partition Labels — extend to the last occurrence of each character
- Best Time to Buy and Sell Stock II — take every upward step
- Assign Cookies; Boats to Save People (two pointers + greedy)
- Candy — two passes, left then right
- Huffman coding; Kruskal's and Prim's MST
- Queue Reconstruction by Height

## 10. Where Greedy looks right but is wrong

- **Coin change, arbitrary denominations** → DP (19). The canonical
  counterexample.
- **0/1 knapsack** → DP. (Fractional knapsack *is* greedy — know the difference.)
- **Longest increasing subsequence** → DP or patience sorting; greedy extension
  fails.
- **Word Break** → DP; greedy longest-match fails on backtracking cases.
- **Any problem where an early choice constrains later ones unpredictably.**
- **"Count the ways"** — greedy produces one solution, not a count.
- **Shortest path with negative edges** — Dijkstra is greedy and breaks;
  Bellman-Ford does not.

**The decision procedure**, in order:

1. Try to state the exchange argument.
2. If you can, use greedy — it will be simpler and faster.
3. If you cannot, look for a counterexample.
4. If you find one, it is DP.
5. If you find neither, and n is small, backtrack. If n is large, think harder
   about the state.

---

## Production Lens

Greedy is the shape of most real schedulers, load balancers, cache eviction
policies (LRU is greedy), bin-packing for deployment, and rate limiters. In
production, greedy's weakness is usually acceptable: a *good* answer computed in
O(n log n) beats an *optimal* answer that does not finish.

The senior move is naming the tradeoff explicitly — "this is a greedy
approximation, it is within X% of optimal, and here is the case where it does
worst" — rather than pretending it is exact.

**Related:** [[Book19-DynamicProgramming]], [[Book22-Intervals]],
[[Book21-Sorting]], [[Book07-PriorityQueue]].
