# Book 05 — Queue

> The book of *"fairness — first in, first out."*

## 1. What problem does this book solve?

Processing items in **arrival order**, where the order itself is part of the
correctness of the answer. The queue's defining property in algorithms: it
explores **in order of distance from the start**, which is why it and only it
gives shortest paths in unweighted graphs.

## 2. Signals

- "In the order they arrived" / FIFO / "first come first served"
- "Level by level" / "layer" / "generation" / "round"
- "Minimum number of steps / moves / transformations"
- "Shortest path" in an **unweighted** graph or grid
- "Nearest" / "closest" reachable state
- "Buffer" / "pipeline" / "scheduling"
- BFS of any kind (17)
- "Spread" / "infect" / "rot" / "flood" over time steps
- Sliding window over a stream where you evict the oldest

**The tell for the algorithmic use:** *minimum* number of steps. If a problem
says "fewest," a queue is almost certainly involved.

## 3. The naive instinct

```csharp
var pending = new List<Node>();
pending.Add(start);
while (pending.Count > 0)
{
    var cur = pending[0];
    pending.RemoveAt(0);        // O(n) — shifts the entire list every time
    ...
}
```

Or, worse for correctness: using a `Stack` and expecting shortest paths.

## 4. Why that is inferior

`List.RemoveAt(0)` shifts every remaining element — O(n) per dequeue, O(n^2)
overall. `Queue<T>` is a circular buffer: dequeue is O(1) with no shifting.

The correctness point is sharper than the performance one. Swap the queue for a
stack in a BFS and it still terminates, still visits every node, and returns a
**wrong** distance. Nothing crashes. That is the dangerous kind of bug.

## 5. What to recognize

`Queue<T>` — FIFO. Enqueue at the back, Dequeue from the front.

The level-order idiom, worth memorizing, because it is how you get "which
step/level am I on" out of a BFS:

```csharp
var q = new Queue<Node>();
q.Enqueue(start);
var visited = new HashSet<Node> { start };
int level = 0;

while (q.Count > 0)
{
    int countThisLevel = q.Count;          // freeze the level boundary
    for (int i = 0; i < countThisLevel; i++)
    {
        var cur = q.Dequeue();
        foreach (var next in Neighbors(cur))
            if (visited.Add(next))          // Book 01 idiom
                q.Enqueue(next);
    }
    level++;
}
```

The `int countThisLevel = q.Count` line before the inner loop is the whole
trick. Without it you cannot tell where one level ends and the next begins.

**Mark visited at enqueue time, not dequeue time.** Marking at dequeue lets the
same node enter the queue many times, which is exponential blowup on dense
graphs and a classic interview failure.

## 6. Complexity

| Operation | Cost |
|---|---|
| `Enqueue` | amortized O(1) |
| `Dequeue` | O(1) |
| `Peek` | O(1) |
| `Contains` | O(n) — use a parallel HashSet |
| `Count` | O(1) |

BFS overall: **O(V + E)** time, **O(V)** space. On an R x C grid: O(R * C).

## 7. C# APIs

```csharp
var q = new Queue<int>();
q.Enqueue(1);
int front = q.Peek();               // throws if empty
int item  = q.Dequeue();            // throws if empty
bool ok  = q.TryPeek(out int p);
bool ok2 = q.TryDequeue(out int v);
q.Count; q.Clear(); q.ToArray();    // front-first
```

Enumeration is **front to back** (unlike `Stack<T>`).

Related: `ConcurrentQueue<T>` (lock-free, multi-producer/consumer),
`System.Threading.Channels` (the modern answer for producer/consumer pipelines
with backpressure), `PriorityQueue<TElement,TPriority>` when order should be by
priority rather than arrival (07).

.NET has **no built-in deque**. When you need both ends — sliding window
maximum (23) — use `LinkedList<T>`, or an index-based ring buffer over an
array, or a `List<T>` used as a monotonic structure with index pointers.

## 8. Common mistakes

1. **`List.RemoveAt(0)` as a dequeue.** O(n^2).
2. **Marking visited on dequeue instead of enqueue.** Duplicates flood the
   queue.
3. **Forgetting the level-size snapshot** when the answer needs a step count.
4. **Using BFS on a weighted graph.** Weighted shortest path is Dijkstra —
   BFS + PriorityQueue (07), not BFS alone.
5. **`Dequeue` on an empty queue throws.** `TryDequeue`.
6. **Unbounded queue growth** in a production consumer — memory exhaustion.
   Bound it (Channels do this properly).
7. **Enqueuing the whole path instead of the node** to reconstruct routes. Store
   a `parent` dictionary and walk it backwards instead; enqueuing paths is
   O(V * pathLength) memory.

## 9. Correct-book problems

- Binary Tree Level Order Traversal; Right Side View; Zigzag order (15)
- Number of Islands (BFS variant) (16)
- Rotting Oranges — multi-source BFS, all sources enqueued at level 0
- Word Ladder — shortest transformation sequence
- Open the Lock; Minimum Knight Moves
- Shortest Path in a Binary Matrix
- 01 Matrix — distance to nearest zero, multi-source BFS
- Course Schedule — Kahn's topological sort (16)
- Perfect Squares — fewest squares summing to n, as a BFS over states
- Task scheduler / rate limiter simulations

**Multi-source BFS** deserves its own note: enqueue *all* starting points before
the loop begins, and the BFS computes the distance to the *nearest* source for
every cell in one pass. Rotting Oranges and 01 Matrix are the same algorithm.

## 10. Where Queue looks right but is wrong

- **LIFO / nesting / matching** → Stack (04).
- **Weighted shortest path** → PriorityQueue + Dijkstra (07). BFS gives the
  wrong answer, silently.
- **You need the smallest item, not the oldest** → PriorityQueue (07).
- **Deep exploration / "does a path exist" / connected components** — DFS is
  simpler and uses less memory when you do not need shortest distance (18).
- **Very wide graphs where you only need reachability** — BFS's frontier can be
  enormous; DFS's stack is proportional to depth.
- **You need to remove from both ends** — not a queue, a deque (23).

---

## Production Lens

For real producer/consumer work, `Queue<T>` + `lock` is the thing juniors write
and seniors replace. Reach for `System.Threading.Channels`
(`Channel.CreateBounded<T>`) — it gives async consumption, backpressure, and
completion signalling, all of which you would otherwise reinvent badly.

`ConcurrentQueue<T>` is right when you need a lock-free FIFO without the
pipeline semantics.

The interview lesson and the production lesson agree here: unbounded queues are
where systems go to die.

**Related:** [[Book04-Stack]], [[Book17-BFS]], [[Book16-Graphs]],
[[Book07-PriorityQueue]], [[Book29-Collections]].
