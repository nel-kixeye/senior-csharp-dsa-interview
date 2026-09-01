# Book 07 — PriorityQueue / Heap

> The book of *"I keep needing the extreme, and the data keeps changing."*

## 1. What problem does this book solve?

Maintaining access to the minimum (or maximum) of a **changing** collection in
O(log n) per update, instead of O(n) per rescan or O(n log n) per re-sort.

The word that matters is **repeatedly**. One min is `Min()`. Ten thousand mins
interleaved with insertions is a heap.

## 2. Signals

- "Top K" / "K largest" / "K closest" / "K most frequent"
- "Kth largest" / "Kth smallest"
- "Repeatedly take the smallest / next / cheapest"
- "Merge K sorted lists/arrays"
- "Schedule by priority" / "next task to run"
- "Streaming" — data arrives over time, you cannot hold or sort it all
- "Running median" (two heaps)
- Dijkstra / A* / minimum spanning tree
- "Cheapest / shortest with weights" — weighted graphs need a heap, not a queue
- "Maximum concurrent meetings" / room allocation (22)

**The tell:** you are about to write "scan the collection to find the min"
*inside* a loop.

## 3. The naive instinct

```csharp
// "Find the 3 largest values"
var sorted = nums.OrderByDescending(x => x).Take(3).ToList();   // O(n log n)

// or, repeatedly:
while (tasks.Count > 0)
{
    var best = tasks[0];
    foreach (var t in tasks) if (t.Priority < best.Priority) best = t;  // O(n)
    tasks.Remove(best);                                                // O(n)
    Process(best);
}
```

## 4. Why that is inferior

The second is O(n^2). The first, sorting for Top-K, is O(n log n) when a
size-K heap gives **O(n log k)** — a large win when k is small and n is huge
(the usual shape: "top 10 of 50 million").

Sorting also requires materializing everything. A size-K heap handles an
infinite stream in O(k) memory. That is the difference between a query that
runs and one that OOMs.

## 5. What to recognize

`PriorityQueue<TElement, TPriority>` (.NET 6+) — a **min-heap**: lowest priority
value dequeues first.

```csharp
var pq = new PriorityQueue<string, int>();
pq.Enqueue("low priority", 10);
pq.Enqueue("urgent", 1);
var next = pq.Dequeue();                 // "urgent"

// Max-heap: negate the priority, or supply a reversed comparer
var maxHeap = new PriorityQueue<int, int>(Comparer<int>.Create((a, b) => b.CompareTo(a)));
```

**The Top-K idiom** — counterintuitive and worth burning in: to find the K
*largest*, keep a **min**-heap of size K. The smallest of your current best K
sits at the top, ready to be evicted the moment something better arrives.

```csharp
var heap = new PriorityQueue<int, int>();      // min-heap
foreach (int x in stream)
{
    heap.Enqueue(x, x);
    if (heap.Count > k) heap.Dequeue();        // evict the smallest
}
// heap now holds the k largest; heap.Peek() is the kth largest
```

`EnqueueDequeue` does both in one sift when the heap is already full — cheaper
than the two-call version above.

## 6. Complexity

| Operation | Cost |
|---|---|
| `Enqueue` | O(log n) |
| `Dequeue` | O(log n) |
| `Peek` | O(1) |
| `EnqueueDequeue` / `DequeueEnqueue` | O(log n), one sift |
| Build from a collection | O(n) via `EnqueueRange` (heapify) |
| Arbitrary removal / update priority | **not supported** |

Top-K over n items: **O(n log k)** time, **O(k)** space.
Dijkstra with a binary heap: O((V + E) log V).

Heapify from an existing collection is O(n), not O(n log n) — pass the whole
collection to the constructor or `EnqueueRange` rather than enqueuing in a loop.

## 7. C# APIs

```csharp
var pq = new PriorityQueue<Job, int>();
pq.Enqueue(job, priority);
pq.EnqueueRange(items);                    // O(n) heapify
Job top = pq.Peek();                        // throws if empty
Job j   = pq.Dequeue();
bool ok = pq.TryPeek(out Job e, out int p);
bool ok2= pq.TryDequeue(out Job d, out int pr);
Job r   = pq.EnqueueDequeue(job, pri);      // push+pop in one operation
pq.Count; pq.Clear();
pq.UnorderedItems;                          // enumeration is NOT sorted
```

Custom comparers for tuple priorities:

```csharp
var pq2 = new PriorityQueue<Node, (int dist, int id)>();   // tie-break by id
```

Before .NET 6 the common substitutes were `SortedSet` with a composite key, or
`SortedList`. If you are on an older target, say so in an interview and use
`SortedSet<(int priority, int uniqueId)>`.

## 8. Common mistakes

1. **Expecting a max-heap.** .NET's is a **min**-heap. Negate or supply a
   comparer.
2. **For Top-K largest, using a max-heap of size K.** Wrong — it evicts your
   best elements. Use a **min**-heap of size K.
3. **Enumerating `UnorderedItems` and expecting sorted output.** The name is a
   warning. Only `Dequeue` is ordered.
4. **Trying to update an element's priority.** Not supported. The standard
   workaround (used in Dijkstra) is *lazy deletion*: enqueue the improved entry
   and skip stale entries on dequeue by checking against your best-known
   distance.
5. **Enqueuing in a loop when you have all the data.** `EnqueueRange` heapifies
   in O(n) instead of O(n log n).
6. **Unstable ordering for equal priorities.** Heaps are not stable. If ties
   must break deterministically, put a sequence number in the priority tuple.
7. **Using a heap when a full sort was needed anyway.** If you need all n in
   order, just sort.

## 9. Correct-book problems

- Kth Largest Element in an Array (and the streaming `KthLargest` class)
- Top K Frequent Elements — Dictionary to count, heap to select (02)
- K Closest Points to Origin
- Merge k Sorted Lists — heap of list heads
- Find Median from Data Stream — max-heap of the low half, min-heap of the high
  half, kept balanced. The two-heap trick is worth knowing by name.
- Task Scheduler; Reorganize String — always take the most frequent remaining
- Meeting Rooms II — min-heap of end times (22)
- Network Delay Time; Cheapest Flights; Path With Minimum Effort — Dijkstra (16)
- Minimum Cost to Connect Sticks / Ropes
- Sliding Window Median

## 10. Where PriorityQueue looks right but is wrong

- **You need all elements sorted.** Just sort — O(n log n) either way, and
  sorting is simpler and has better constants.
- **K is close to n.** Sorting beats the heap; the O(n log k) advantage
  evaporates.
- **The data never changes.** Sort once and index.
- **You need arbitrary lookup or removal.** Heaps do not support it →
  SortedSet (08).
- **Unweighted shortest path.** A plain Queue is correct and faster — the heap
  is pure overhead (05, 17).
- **You need the min once.** `Enumerable.Min()` is O(n) and clearer than
  building a heap.
- **You need a sorted *unique* collection with range queries.** → SortedSet (08).

---

## Production Lens

`PriorityQueue<T,TPriority>` is not thread-safe and has no bounded/blocking
variant. For real scheduling work, look at `Channels` with priority tiers, a
proper job queue (Hangfire, Quartz), or the cloud provider's queue service
before hand-rolling.

The Top-K-over-a-stream pattern, though, is genuinely useful production code:
"top N offenders from a log stream" in O(N) memory instead of sorting a file
you cannot fit in RAM.

**Related:** [[Book08-SortedSet-SortedDictionary]], [[Book05-Queue]],
[[Book21-Sorting]], [[Book16-Graphs]], [[Book22-Intervals]].
