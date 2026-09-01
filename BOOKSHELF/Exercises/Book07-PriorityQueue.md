# Exercises — Book 07: PriorityQueue / Heap

**Reach for it when:** you repeatedly need the extreme of a *changing* set.
**Remember:** .NET's `PriorityQueue` is a **min**-heap. For the K *largest*, keep
a **min**-heap of size K.

---

### E07.1 — Kth Largest Element in an Array
Return the kth largest element (in sorted order, not the kth distinct value).

- **Constraints:** up to 10⁵ elements; `1 <= k <= n`.
- **Target:** better than O(n log n).
- **Edge cases:** `k = 1` (the max); `k = n` (the min); duplicates; all identical.
- **Before you code:** name **three** valid approaches and their complexities.
  Then pick one and justify it for `n = 10⁵, k = 5`.

### E07.2 — K Closest Points to Origin
Given points on a plane and an integer `k`, return the `k` closest to `(0,0)`.

- **Constraints:** up to 10⁴ points; any order in the result.
- **Target:** O(n log k) time, O(k) space.
- **Edge cases:** `k` equals the number of points; ties in distance; points at
  the origin; negative coordinates.
- **Before you code:** do you need `Math.Sqrt`? Answer before writing — it
  changes both correctness risk and speed.

### E07.3 — Task Scheduler
Given task labels and a cooldown `n`, each identical task must be separated by at
least `n` intervals. Return the minimum total intervals (including idles) to run
all tasks.

- **Constraints:** up to 10⁴ tasks, 26 labels; `0 <= n <= 100`.
- **Target:** O(total tasks) time.
- **Edge cases:** `n = 0` (answer is just the task count); all tasks identical;
  all tasks distinct; two labels tied for most frequent.
- **Before you code:** two books here — one counts, one selects. Which task
  should you always schedule next, and why is that greedy choice safe?
- **Follow-up:** there is a closed-form formula using only the maximum frequency
  and the number of labels tied at it. Can you derive it?

### E07.4 — Find Median from Data Stream
Design a structure supporting `AddNum(int)` and `FindMedian()` over a growing
stream.

- **Constraints:** up to 5·10⁴ calls. `FindMedian` should be O(1).
- **Target:** O(log n) per insert, O(1) per median.
- **Edge cases:** first element; even vs odd count; all duplicates; strictly
  descending input.
- **Before you code:** one heap cannot do this. What does *two* heaps let you
  see, and what invariant must you maintain between them after every insert?

### E07.5 — Merge k Sorted Lists
Merge `k` sorted linked lists into one sorted list.

- **Constraints:** up to 10⁴ total nodes, `k` up to 10⁴; some lists may be empty.
- **Target:** O(N log k) for N total nodes.
- **Edge cases:** `k = 0`; all lists empty; one list; lists of very unequal
  length.
- **Before you code:** why is concatenate-then-sort (O(N log N)) worse? Say what
  information it throws away.

---
---

# ⛔ STOP — hints below

---

**E07.1**
- *Nudge:* You do not need the other n − k elements in order.
- *Structure:* min-heap of size `k`.
- *Skeleton:* `pq.Enqueue(x, x); if (pq.Count > k) pq.Dequeue();` → `pq.Peek()`
  is the answer. O(n log k).
- *The three approaches:* sort O(n log n); heap O(n log k); quickselect O(n)
  average / O(n²) worst. For n = 10⁵, k = 5, the heap is the safe pick — near
  O(n) with no worst-case cliff.

**E07.2**
- *Nudge:* Comparing squared distances preserves ordering.
- *Structure:* max-heap of size `k` keyed on squared distance — here you want the
  *closest*, so you evict the **farthest**, which means a **max**-heap. (Mirror
  of E07.1 — think about why.)
- *Skeleton:* priority `= x*x + y*y`, with a reversed comparer or negated
  priority. Skip `Math.Sqrt` entirely: it costs time and introduces floating-point
  error for no benefit.

**E07.3**
- *Nudge:* Always run whichever remaining task is most frequent.
- *Structure:* `int[26]` counts + a max-heap of counts; process in rounds of
  `n + 1` slots.
- *Skeleton:* each round, pop up to `n + 1` tasks, decrement each, re-push those
  still remaining. Add idles when a round is short *and* tasks remain.
- *Follow-up rung:* `max((maxFreq - 1) * (n + 1) + countOfMaxFreqLabels, totalTasks)`.
  The `max` handles the case where there are so many distinct tasks that no idling
  is ever needed.

**E07.4**
- *Nudge:* Split the data at the median: everything below, everything above.
- *Structure:* **max**-heap for the lower half, **min**-heap for the upper half.
- *Skeleton:* always push to one heap, immediately move its top to the other, then
  rebalance so the sizes differ by at most one. Median is the larger heap's top,
  or the average of both tops when sizes are equal.

**E07.5**
- *Nudge:* At any moment, the next node is the smallest among the current heads.
- *Structure:* heap holding one node per list — size `k`, not `N`.
- *Skeleton:* seed the heap with every non-null head. Pop the smallest, append it
  to the result, and push that node's `next` if it exists. Use a dummy head for
  the output.
- *Alternative:* divide and conquer — pairwise-merge lists, halving `k` each round.
  Same O(N log k), no heap.
