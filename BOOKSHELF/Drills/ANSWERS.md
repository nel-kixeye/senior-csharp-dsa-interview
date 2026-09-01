# Answers

**Open this only after you have committed to an answer in writing.**

Each entry gives: the book, the signal you should have caught, complexity, the
naive cost, the C# tool, and — where relevant — the trap.

---

## Level 1 — Obvious

### D01 — Any duplicates?
**Book 01 — HashSet.**
Signal: *"appears more than once"* — a pure presence question, no payload.
O(n) time, O(n) space. Naive nested loop: O(n²).
`if (!seen.Add(n)) return true;` — one call does check-and-insert.
*Note:* if the array were sorted, adjacent comparison gives O(1) space.

### D02 — Count every value
**Book 02 — Dictionary.**
Signal: *"number of occurrences"* — the answer is not a bool, so a set cannot
hold it.
O(n) time, O(distinct) space. Naive `Distinct().Count()` per value: O(n²).
`freq[v] = freq.GetValueOrDefault(v) + 1;` or `.CountBy(x => x)` (.NET 9).

### D03 — Process uploads in submission order
**Book 05 — Queue.**
Signal: *"in the order they were submitted"* — FIFO, stated literally.
O(1) enqueue and dequeue. Naive `List.RemoveAt(0)`: O(n) per item, O(n²) total.
`Queue<T>`. **Production:** `Channel<T>` — bounded, async, with backpressure.

### D04 — Balanced brackets
**Book 04 — Stack.**
Signal: *nesting* plus **multiple bracket types**. A counter handles one type;
only a stack knows *what* was opened.
O(n) time, O(n) space.
`Stack<char>`. Three failure modes: closer on an empty stack, type mismatch, and
**leftover items at the end** — the last is the one most often forgotten.

### D05 — Target present in a static sorted array
**Book 12 — Binary Search.** O(log n) time, O(1) extra space.
Naive linear scan: O(n) per query, unusable across millions of queries.
`Array.BinarySearch(arr, target)`.
**The senior addendum:** if you only ever need *membership* and memory allows, a
`HashSet<int>` (or `FrozenSet<int>`, .NET 8+) answers in O(1) and beats binary
search in practice — one cache miss instead of log n. Binary search wins when
you also need ordering facts: nearest, range, predecessor. Saying this out loud
is a stronger answer than either alone.

### D06 — 3 largest from a 10M stream
**Book 07 — PriorityQueue.**
Signal: *"cannot hold them all"* + *"largest"*. Streaming rules out sorting.
O(n log k) time, **O(k) space**.
Keep a **min**-heap of size 3 — counterintuitive but correct: the smallest of
your best three sits on top, ready to be evicted.
`pq.Enqueue(x, x); if (pq.Count > 3) pq.Dequeue();`

### D07 — 100k range-sum queries, static array
**Book 11 — Prefix Sum.**
Signal: *"never changes"* + repeated range queries.
O(n) build, **O(1) per query**. Naive: O(q·n).
`long[] prefix` with a leading zero; `sum(i..j) = prefix[j+1] - prefix[i]`.
Use `long` — `int` sums overflow.

### D08 — Max sum of 5 consecutive
**Book 10 — Sliding Window (fixed).**
Signal: *"consecutive"* + fixed size.
O(n) time, O(1) space. Naive: O(n·k) recomputing each window.
`sum += nums[r]; if (r >= k) sum -= nums[r - k];`

### D09 — Pair summing to target in a sorted array, O(1) space
**Book 09 — Two Pointers.**
Signal: *"sorted"* + *"pair"* + **O(1) space**.
O(n) time, O(1) space. Naive: O(n²).
`lo`/`hi` converging; `sum < target ? lo++ : hi--`.

### D10 — Comma-separate 50,000 names
**Book 33 — Built-in methods.** `string.Join(", ", names)`.
O(n) time, **one allocation**. Naive `+=` in a loop: O(n²) and ~n allocations.
StringBuilder is correct too, but `string.Join` is the direct expression of
"combine a collection with a separator" — reach for the named operation.

### D11 — Count islands in a grid
**Book 16 / 18 — Graph, DFS (or BFS).**
Signal: *"grid"* + *"connected"* — a grid is a graph with implicit 4-neighbour
adjacency.
O(rows × cols) time and space.
Sink each island in place (`grid[r][c] = '0'`) to avoid a separate visited set.
Outer double loop finds each new component. Union-Find also works.
*Watch:* recursive DFS on a very large grid overflows the stack — go iterative.

### D12 — Distinct tags, order irrelevant
**Book 01 — HashSet.**
Signal: *"each distinct exactly once"* + *"order does not matter"*.
O(n). `tags.ToHashSet()` or `.Distinct()`.
`Distinct()` preserves first-seen order; `HashSet` does not promise any. Since
order is irrelevant, `HashSet` states the intent better.

---

## Level 2 — Mixed

### D13 — First value appearing twice, scanning left to right
**Book 01 — HashSet.** Still a set — nothing changed.
The trap: "first" sounds positional, so people reach for `Dictionary<int,int>`,
count everything, then find the minimum index. That is two passes and more
memory for no benefit. Scanning left to right, the **first** `Add` that returns
false *is* the answer.
O(n) / O(n). `if (!seen.Add(n)) return n;`
**Rejected:** Dictionary — you need presence, not a payload.

### D14 — First non-repeating character
**Book 02 — Dictionary.** Now it *does* change.
A set cannot distinguish "seen once" from "seen twice," and you need that
distinction. Count in pass 1, rescan the **string** (not the dictionary) in pass
2 for the first character with count 1.
O(n) / O(σ). For lowercase ASCII, `int[26]` beats a Dictionary.
**Rejected:** HashSet — cannot count. This is the D13/D14 pair: *presence*
versus *frequency*, one word apart.

### D15 — Two Sum, unsorted, return indices
**Book 02 — Dictionary.**
Two pointers is eliminated by two words: the array is **unsorted**, and sorting
to fix that **destroys the indices** you must return.
O(n) / O(n). One pass, `Dictionary<value, index>`:
`if (seen.TryGetValue(target - nums[i], out int j)) return [j, i];`
**Rejected:** Two Pointers (D09's answer) — the classic misfire.

### D16 — 50th largest of 1,000,000
**Legitimately more than one answer.** Say the tradeoff:
- **Heap (Book 07):** min-heap of size 50 → O(n log k), O(k) space. Best when k
  is small relative to n, and the only option if the data streams.
- **Quickselect (Book 21):** O(n) average, O(1) space, but O(n²) worst case and
  it mutates the array.
- **Sort (Book 21):** O(n log n) — simplest, fine if you also need other order
  statistics.
With k = 50 and n = 10⁶, heap or quickselect. Naming all three and choosing is a
stronger answer than picking one.

### D17 — Longest substring without repeating characters
**Book 10 — Sliding Window** + **Book 02 — Dictionary**.
Signal: *"substring"* (contiguous) + a condition on window contents.
O(n) time, O(min(n, σ)) space.
`Dictionary<char,int>` of last-seen index, or a `HashSet` shrunk from the left.
Record the best **outside** the shrink loop — this is a *longest* problem.

### D18 — Merge overlapping intervals
**Book 22 — Intervals**, via **Book 21 — Sorting**.
Sort by **start**, then one pass.
O(n log n) / O(n).
`merged[^1][1] = Math.Max(merged[^1][1], iv[1])` — `Math.Max` matters: the next
interval may be fully contained, and plain assignment would shrink the range.

### D19 — Group anagrams
**Book 02 — Dictionary**, keyed by a canonical form.
Signal: *"group"* — a grouping problem, so `GroupBy` or `Dictionary<K,List<V>>`.
Key = sorted characters, or a 26-count signature.
O(n · L log L) with a sorted key; O(n · L) with counts.

### D20 — Are two strings anagrams?
**Book 02 / 24 — character counts**, *not* grouping.
Different question: a single pairwise comparison, not a partition of a
collection.
O(n) time, **O(1) space** with `int[26]`. Check lengths first for an O(1) exit.
Increment for `s`, decrement for `t` in one loop; all zeros means anagram.
**The D19/D20 pair:** same word, different structure. Grouping needs a map from
key to members; comparison needs only the key.

### D21 — Level-order tree traversal
**Book 05 — Queue** (**Book 17 — BFS**).
Signal: *"level by level"*.
O(n) / O(width).
The `int size = q.Count` snapshot before the inner loop is what separates one
level from the next.
**Rejected:** recursion — DFS visits depth-first; you would have to carry a
depth and bucket results, which works but is not the natural shape.

### D22 — Validate a BST
**Book 13 / 15 — Recursion over a tree**, passing down `(min, max)` bounds.
The trap, and it is the whole question: comparing each node only to its
**parent** is wrong. A node deep in the left subtree can exceed the root while
satisfying every local check.
O(n) / O(h). Use `long` bounds (or nullable) so that node values of
`int.MinValue`/`int.MaxValue` do not break the sentinels.
*Alternative:* inorder traversal must be strictly increasing.

### D23 — Single value among pairs, O(1) space
**Book 25 — Bit Manipulation (XOR).**
Signal: *"every value twice except one"* + **O(1) space**.
O(n) / **O(1)**. `result ^= n` for all n.
`a ^ a == 0` and `a ^ 0 == a`, and XOR is commutative — every pair cancels
regardless of order.
**Rejected:** HashSet / Dictionary — both correct, both O(n) space, both fail the
stated constraint. The constraint *is* the signal.

### D24 — Running median of a stream
**Book 07 — PriorityQueue**, two of them.
Max-heap for the lower half, min-heap for the upper half, sizes kept within one
of each other. Median is the top of the larger heap, or the average of both tops.
O(log n) per insertion, O(1) per median query.
**Rejected:** sorting per query — O(n log n) each time. SortedSet fails outright
on duplicate values (.NET has no multiset).

---

## Level 3 — Deceptive

### D25 — Days until a warmer temperature
**Book 23 — Monotonic Stack.**
The naive scan-forward-from-each-day is O(n²) and re-examines days a previous
iteration already proved too cold.
O(n) time, O(n) space — each index is pushed once and popped once.
`Stack<int>` of **indices** (you need `i - stack.Peek()` for the day count).
Pop while `temps[stack.Peek()] < temps[i]`: *"I am the answer to everyone
smaller who was waiting."*

### D26 — Count subarrays summing to k, with negatives
**Book 11 — Prefix Sum** + **Book 02 — Dictionary**.
The trap is the sliding window: shrinking only reduces the sum when values are
**non-negative**. Negatives destroy that monotonicity, so the window is unsound.
O(n) / O(n). `Dictionary<runningSum, count>`, seeded **`[0] = 1`** — that seed
accounts for subarrays starting at index 0 and is the most-forgotten line in the
pattern.
`count += seen.GetValueOrDefault(running - k);`

### D27 — Minimum ship capacity within D days
**Book 12 — Binary Search on the answer.**
Signal: *"minimum X such that it is possible"* + a range up to 10⁹ + a cheap
feasibility check. And crucially: **if capacity C works, every capacity above C
also works** — monotone, so the boundary is binary-searchable.
O(n log(range)). Naive linear scan over 10⁹ candidates: hopeless.
`lo = max(weights)`, `hi = sum(weights)`, predicate = `DaysNeeded(mid) <= D`.

### D28 — Longest consecutive sequence, O(n)
**Book 01 — HashSet**, with the sequence-start check.
Sorting is the instinct and the constraint forbids it (O(n log n)).
Put everything in a set. For each value, **only start counting if `v - 1` is not
in the set** — that guard is what keeps it O(n) rather than O(n²), because each
run is walked exactly once.
O(n) / O(n).

### D29 — Maximum of every window of size k
**Book 23 — Monotonic Deque.**
A window is clearly involved, but a sum is incremental and a **maximum is not** —
when the max leaves the window you cannot reconstruct the new one without help.
O(n) / O(k). Naive: O(n·k).
Deque of indices with decreasing values: evict from the **front** when out of
window, from the **back** while smaller than the incoming value. Front is always
the max.
.NET has no `Deque<T>` — use `LinkedList<int>` or an array ring buffer.
**Rejected:** Stack — you need eviction from both ends.

### D30 — Fewest coins, arbitrary denominations
**Book 19 — Dynamic Programming.**
Greedy is the instinct and it is **wrong**: with `{1,3,4}` and amount 6, greedy
takes 4+1+1 = 3 coins; optimal is 3+3 = 2.
O(amount × coins) time, O(amount) space.
`dp[a] = min(dp[a - coin] + 1)`, `dp[0] = 0`, others initialized to a sentinel —
and guard the sentinel before adding 1, or it overflows.
Greedy *is* correct for canonical systems like `{1,5,10,25}`, which is exactly
why the instinct feels reliable.

### D31 — Maximum non-overlapping intervals
**Book 20 — Greedy** + **Book 21 — Sorting**, sorted by **end**.
The trap is sorting by start, which is the intuitive choice and wrong. The
interval that **finishes earliest** leaves the most room for everything after it.
O(n log n) / O(1).
The exchange argument: swapping any optimal solution's first interval for the
earliest-ending one never makes it worse.

### D32 — Minimum window substring
**Book 10 — Sliding Window (variable)** + **Book 02 — Dictionary**.
O(n + m) / O(σ).
This is a *shortest* problem, so record the best **inside** the shrink loop —
the mirror image of D17. Getting that placement backwards is the classic bug.
Track a `matched` counter that increments only when a character's count reaches
its requirement, so validity is O(1) to test rather than a dictionary scan.

### D33 — Trapping rain water
**Book 09 — Two Pointers** (O(1) space) or **Book 23 — Monotonic Stack**.
Naive per-bar "scan left and right for the max": O(n²).
Two pointers: O(n) time, **O(1) space** — move whichever side has the smaller
wall, because that side alone determines the water at that position.
Prefix-max/suffix-max arrays also work at O(n) space, and are easier to derive
under pressure.

### D34 — Product of array except self
**Book 11 — Prefix Sum**, in its product form.
Naive: O(n²). Division is forbidden (and would break on zeros anyway).
O(n) time, O(1) extra space excluding the output.
Two passes: fill the output with prefix products left-to-right, then multiply
through by a running suffix product right-to-left.

### D35 — Cycle in a linked list, O(1) space
**Book 06 — Fast/slow pointers (Floyd).**
O(n) / **O(1)**.
`slow = slow.next; fast = fast.next.next;` — they meet inside a cycle.
Guard `fast != null && fast.next != null` or you dereference null.
**Rejected:** `HashSet<ListNode>` of visited nodes — correct, O(n) space, fails
the constraint. Again, the constraint is the signal.

### D36 — Longest palindromic substring
**Book 24 / 09 — Expand around center.**
Naive: generate all substrings and test each — O(n³) with allocation per
substring.
Expand around center: O(n²) time, **O(1) space**, and far easier to get right
than the O(n²)-space DP.
2n − 1 centers: n single characters (odd lengths) and n − 1 gaps (even lengths).
Manacher's gives O(n); worth *naming*, rarely worth writing.

---

## Level 4 — Combined

### D37 — Top k frequent elements
**Book 02 (Dictionary)** + **Book 07 (PriorityQueue)**.
Jobs: Dictionary counts each element in one pass; a size-k min-heap selects the
best k without sorting all distinct values.
O(n + d log k) where d = distinct count. Space O(d).
Dictionary alone gives counts but not the selection; a heap alone has nothing to
rank.
**Alternative:** bucket sort by frequency (index = count) gives **O(n)** — worth
naming, since frequencies are bounded by n.

### D38 — Count subarrays summing to k
**Book 11 (Prefix Sum)** + **Book 02 (Dictionary)**.
Jobs: prefix sums turn "sum of a range" into "difference of two prefixes"; the
Dictionary counts how many earlier prefixes equal `running - k`, so all matching
start points are found in O(1).
O(n) / O(n). Seed `[0] = 1`.
Same as D26 — the exercise here is *naming both books and their jobs*.

### D39 — Weighted shortest path from a source
**Book 16 (Graph)** + **Book 07 (PriorityQueue)** = **Dijkstra**.
Jobs: the graph is the adjacency structure; the heap always yields the
nearest unsettled node, which is what makes the greedy choice safe.
O((V + E) log V).
**The trap:** BFS. On a weighted graph BFS returns a wrong answer, not a slow
one — fewest *edges* is not lowest *cost*.
Priorities cannot be updated in .NET's `PriorityQueue`; use lazy deletion (skip
a popped node whose recorded distance is stale).
Negative weights: Dijkstra is invalid → Bellman-Ford.

### D40 — Course order with prerequisites
**Book 16 (Graph)** + **Book 05 (Queue)** = **Kahn's topological sort**.
Jobs: graph models dependencies; the queue holds every node whose prerequisites
are all satisfied (in-degree 0).
O(V + E).
Cycle detection is free: if the produced order has fewer than n nodes, the
remainder is a cycle and no valid order exists.
DFS with reverse postorder is the equivalent alternative.

### D41 — O(1) LRU cache
**Book 02 (Dictionary)** + **Book 06 (LinkedList)**.
Jobs: the Dictionary gives O(1) lookup **from key to the node**; the doubly
linked list gives O(1) removal and re-insertion at the front, which the
Dictionary cannot do and a `List<T>` cannot do in O(1).
`Dictionary<TKey, LinkedListNode<(TKey, TValue)>>`.
This is the one problem where `LinkedList<T>` is genuinely the right production
choice — you hold the node reference, so removal really is O(1).
**Production:** `MemoryCache` with a size limit, or an existing LRU package.

### D42 — Minimum meeting rooms
**Book 21 (Sorting)** + **Book 07 (PriorityQueue)**.
Jobs: sort by start so meetings are considered in time order; the min-heap of
**end times** tells you whether the earliest-freeing room is available.
O(n log n) / O(n).
**Alternative:** sweep line — emit `(start, +1)` and `(end, −1)`, sort, and track
the running maximum. Tie-break `−1` before `+1` so a meeting ending at 10 frees
the room for one starting at 10; getting that backwards inflates the answer by 1.

### D43 — All unique triplets summing to zero
**Book 21 (Sorting)** + **Book 09 (Two Pointers)**.
Jobs: sorting enables the converging scan **and** makes duplicates adjacent so
they can be skipped.
O(n²) time, O(1) extra space (excluding output). Naive triple loop: O(n³).
Fix `i`, two-point the remainder. Skip duplicates at all three positions —
omitting that is the most common bug, and it produces repeated triplets rather
than a crash.

### D44 — Longest substring with at most k distinct characters
**Book 10 (Sliding Window)** + **Book 02 (Dictionary)**.
Jobs: the window is the contiguous range; the Dictionary tracks counts so
`count.Count` is the number of distinct characters in the window.
O(n) / O(k).
Shrink with `while (count.Count > k)`, and **remove the key when its count hits
zero** — otherwise `count.Count` overstates the distinct count and the window
never shrinks correctly.

### D45 — Shortest word-ladder transformation
**Book 01 (HashSet)** + **Book 17 (BFS)**.
Jobs: the HashSet is the word dictionary (O(1) validity checks) *and* the visited
set; BFS guarantees the **shortest** sequence.
O(N · L · 26) where L is word length — generate neighbours by substituting each
position with each letter, rather than comparing against all N words.
**The trap:** DFS. It finds *a* transformation, not the shortest.
Bidirectional BFS is the strong follow-up.

### D46 — Merge k sorted linked lists
**Book 07 (PriorityQueue)** + **Book 06 (LinkedList)**.
Jobs: the heap holds the current head of each list, so the global minimum is
always O(log k) away; the lists supply the sorted order.
O(N log k) for N total nodes, O(k) space.
**Alternative:** divide and conquer — pairwise merge, same O(N log k), no heap.
Naive concatenate-then-sort is O(N log N) and discards the sortedness you were
handed.

---

## Level 5 — Interview Simulation

### D47 — Top 10 IPs in a 50 GB log
**Books:** 02 (Dictionary) + 07 (PriorityQueue).
**Instinct to catch:** "load it and sort." The file does not fit.
**The answer:** stream the file line by line; `Dictionary<string,int>` of counts;
a size-10 min-heap for selection. O(n) time; space is O(distinct IPs), which is
the real question — distinct IPv4 addresses are bounded (~4×10⁹ worst case, far
fewer in practice), so the count map usually fits even when the file does not.
**Production:** if distinct keys do *not* fit, hash-partition the file into
buckets by `hash(ip) % N`, count each bucket independently, then merge the
per-bucket top-10s. Or accept approximation with Count-Min Sketch / `HyperLogLog`.
And before any of it: this is `sort | uniq -c | sort -rn | head`, or a query in
whatever log platform already ingests this.

### D48 — Rolling-window rate limiter
**Books:** 10 (Sliding Window, time-based) + 05 (Queue) + 02 (Dictionary).
**Instinct to catch:** a fixed counter reset every 60 seconds. That allows 200
requests across a window boundary — the classic fixed-window burst bug.
**The answer:** per user, a queue of timestamps; on each request evict entries
older than 60s from the front, then test `Count < 100`. O(1) amortized.
**The memory trap:** 50,000 users × 100 timestamps is fine; unbounded user growth
is not. Evict idle users.
**Production:** `System.Threading.RateLimiting` (.NET 7+) has sliding-window and
token-bucket limiters built in. Distributed across instances, this belongs in
Redis, not in process memory — a per-instance limiter with N instances permits
N× the intended rate.

### D49 — Detect and *report* a circular dependency
**Books:** 16 (Graph) + 18 (DFS with three-state colouring).
**The discrimination point:** Kahn's topological sort (D40) detects *that* a
cycle exists but does not tell you *which* nodes form it. Here the requirement is
to report the cycle so a developer can fix it — so use **DFS**, where the
recursion stack *is* the path. When you meet a node coloured "in progress," the
cycle is the current path from that node onward.
Three states: unvisited / in-current-path / fully-explored. A plain two-state
visited set produces false positives on cross edges.
O(V + E).
**Production:** report every cycle, not just the first, and report node names
rather than indices. Error message quality is the actual deliverable.

### D50 — Prefix autocomplete, top 5, 10 ms, 2M terms
**Books:** 15 (Trees — Trie) + 07 (PriorityQueue) or precomputation.
**Instinct to catch:** scan all 2,000,000 terms with `StartsWith`. That is O(n·L)
per keystroke and will not make 10 ms reliably.
**The answer:** a trie over the alphabet; walk the prefix in O(L), then return
results from that node. Precompute and **store the top 5 completions at each
node** at build time — then a query is O(L) with no ranking work at all.
**Alternative without a trie:** sort all terms once; a prefix defines a
contiguous range, so two binary searches (lower and upper bound, Book 12) find
it in O(log n). Simpler, and often fast enough — worth naming.
**Production:** this is what a search index does. Elasticsearch completion
suggesters, Lucene FSTs, or a managed search service exist precisely for this.

### D51 — Seats reserved per day from range bookings
**Book 11 — Prefix Sum, difference-array form.**
**Instinct to catch:** loop over each booking, then over each day in its range.
That is 100,000 × 50,000 = 5×10⁹ operations.
**The answer:** for each booking, `diff[first] += seats; diff[last + 1] -= seats;`
— O(1) per booking. Then one prefix-sum pass over the 50,000 days.
**O(bookings + days)**, about 150,000 operations. Roughly 30,000× fewer.
Watch the `last + 1` bound (size the array `days + 1`) and use `long` for the
accumulator.

### D52 — Deduplicate 100M records that exceed memory
**Books:** 01 (HashSet) conceptually + 21 (Sorting) for the external strategy.
**Instinct to catch:** `records.Distinct()` or one big `HashSet`. Neither fits.
**The answer — hash partitioning:** write each record to one of N files chosen by
`hash(record) % N`. Identical records always land in the same file. Dedupe each
file independently with an in-memory HashSet, then concatenate. Choose N so each
partition fits comfortably in RAM. O(n) passes over the data, bounded memory.
**Alternative:** external merge sort, then drop adjacent duplicates in one pass —
O(n log n) but sequential I/O, which is friendlier on spinning disks.
**Approximate:** a Bloom filter gives O(1) memory per record with false
positives (never false negatives) — acceptable when "probably unique" is enough.
**Production:** this is a `GROUP BY`, a Spark job, or `sort -u`. Say so.

### D53 — Median of two sorted arrays in O(log(m+n))
**Book 12 — Binary Search**, on the **partition** rather than on a value.
**Instinct to catch:** merge and take the middle — O(m + n), which the constraint
forbids.
**The answer:** binary search the smaller array for the cut point that splits
both arrays into a left half and a right half of the correct combined size, such
that `maxLeft <= minRight` across both. The median then comes from the boundary
values. O(log(min(m, n))).
Edge cases dominate: empty partitions (use ±infinity sentinels), odd versus even
total length, and always searching the **smaller** array so the index arithmetic
stays in range.
**Getting the book right matters more than the implementation here** — this is a
problem where "binary search on the partition, O(log min(m,n))" earns most of the
credit even if the indices take a few tries.

### D54 — Minimum completion time with unlimited workers
**Books:** 16 (Graph) + 05/17 (topological order) + 19 (DP).
**Instinct to catch:** sum all durations. With unlimited parallelism that is
wrong — independent tasks run simultaneously.
**The answer:** the **critical path** through the DAG.
`finish[task] = duration[task] + max(finish[prerequisite])`, evaluated in
topological order so every prerequisite is final before you use it. The answer is
`max(finish)` over all tasks.
O(V + E).
This is longest-path-in-a-DAG, which is tractable precisely *because* the graph
is acyclic — longest path in a general graph is NP-hard. Worth saying.
**Production:** this is exactly what MSBuild, Bazel, and every CI scheduler
compute. A cycle here means the build configuration is broken (D49).

---

## Cross-cutting lessons

Reading back over the 54, five patterns account for most of the misses:

1. **The constraint is the signal.** "O(1) space" (D23, D35), "O(n)" (D28),
   "does not fit in memory" (D06, D47, D52) each eliminate the obvious answer.
   Read the constraints before choosing.

2. **Presence vs. payload** decides HashSet vs. Dictionary, and one word usually
   flips it (D13/D14).

3. **Contiguous vs. non-contiguous** decides window vs. DP. "Substring" and
   "subsequence" are not synonyms (D17, D26).

4. **Sorting destroys indices.** If the answer is positions, sorting needs a
   plan (D15).

5. **The nested loop is recomputing something.** Name the wasted work and the
   structure names itself (D25, D26, D29, D34, D51).

When an answer surprised you, go back to the book's Section 2 and re-read only
the signals. That is the part worth rereading; the rest is reference.
