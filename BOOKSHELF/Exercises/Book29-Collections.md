# Exercises — Book 29: Collection Choice

**Different in character.** Design-judgment exercises. The question is never "can
you use a Dictionary" — it is *"which operation will I perform most often, and
which collection makes that O(1)?"*

---

### E29.1 — Choose the collection
For each scenario, name the collection and the single operation that decides it.
One sentence each.

1. Config keys loaded once at startup, read on every request for the process
   lifetime.
2. A `visited` marker during a graph traversal of 10⁶ nodes.
3. Undo history for a text editor.
4. Jobs to run, always taking the highest-priority one next.
5. Autocomplete over a fixed word list where you need "all words between `app` and
   `apq`".
6. A fixed board of 9×9 cells in a Sudoku solver.
7. Counting how many times each HTTP status code was returned, in a shared
   in-memory metrics object updated by many request threads.
8. A queue of work items produced by one thread and consumed by another, where the
   producer must slow down if the consumer falls behind.
9. A frequently-mutated list of 100,000 items where you constantly remove from the
   middle and you already hold a reference to the item.
10. The result of a query, returned from a public API method, that callers must
    not modify.

### E29.2 — Find the quadratic
Each snippet is O(n²) or worse. Name why, and fix it.

```csharp
// A
var result = new List<int>();
foreach (var x in source) if (!result.Contains(x)) result.Add(x);

// B
while (pending.Count > 0) { var next = pending[0]; pending.RemoveAt(0); Process(next); }

// C
foreach (var item in items) { sorted.Add(item); sorted.Sort(); UseSmallest(sorted[0]); }

// D
for (int i = 0; i < list.Count; i++) if (list[i].IsExpired) list.RemoveAt(i);
```

- **Before you code:** D has a **second** bug beyond the complexity. Find it.

### E29.3 — Design: the LRU cache
Design a fixed-capacity cache with O(1) `Get` and `Put`, evicting the least
recently used entry.

- **Before you code:** name the two structures and the exact job of each. Then
  answer: why can a `List<T>` not replace the second one, and why can the first one
  not do the job alone?
- **Then:** what does the dictionary's **value** type have to be for the removal to
  actually be O(1)?
- **Production:** name what you would use instead of hand-rolling this, and one
  thing it gives you that your version does not.

### E29.4 — The concurrency trap
This runs fine in testing and hangs in production.

```csharp
private static readonly Dictionary<string, int> _counts = new();

public void Record(string key)
{
    _counts[key] = _counts.GetValueOrDefault(key) + 1;
}
```

- **Explain:** what actually happens under concurrent calls — and be specific, it
  is worse than "the count might be wrong".
- **Fix it three ways:** with a lock, with a concurrent collection, and with a
  design change that avoids shared mutable state entirely.
- **Then:** why is `ConcurrentDictionary`'s `_counts[key] = _counts[key] + 1`
  **still** wrong, and what is the correct API?

### E29.5 — Interview answer vs production answer
For each, give both answers and say what changes between them.

1. `new Dictionary<string, User>()` — what would you add in production code?
2. `new HashSet<int>()` used as a `visited` set — anything to change?
3. Returning `List<Order>` from a public service method.
4. `new Queue<WorkItem>()` for a background processing pipeline.
5. A `Dictionary<CustomerId, decimal>` where `CustomerId` is a custom `class`.

---
---

# ⛔ STOP — hints below

---

**E29.1**
1. `FrozenDictionary` (.NET 8+) — build once, probe forever.
2. `HashSet<T>`, or `bool[]` if node ids are dense `0..n-1` (faster, less memory).
3. `Stack<T>` — LIFO is literally the undo semantic.
4. `PriorityQueue<T,P>` — repeated extraction of the extreme.
5. `SortedSet<string>` with `GetViewBetween` — ordered range query. (A trie or a
   sorted array + binary search also works.)
6. `char[,]` or `int[81]` — fixed size, dense indices, best locality.
7. `ConcurrentDictionary<int,int>` with `AddOrUpdate` — concurrent mutation.
8. `Channel<T>` bounded — the "producer must slow down" clause is backpressure,
   which `ConcurrentQueue` does not provide.
9. `LinkedList<T>` — the *only* scenario where it wins, and only because you hold
   the node reference.
10. `IReadOnlyList<T>` as the return type (backed by a `List<T>` internally).

**E29.2**
- **A:** `List.Contains` is O(n) inside an O(n) loop. → `source.Distinct()`, or a
  `HashSet` for membership plus a `List` if you need first-seen order.
- **B:** `RemoveAt(0)` shifts every element. → `Queue<T>` with `Dequeue()`.
- **C:** re-sorting on every insert is O(n² log n). → `PriorityQueue` (if you only
  need the smallest) or `SortedSet` (if you need full order).
- **D:** `RemoveAt` inside a forward loop is O(n²) **and** skips the element after
  each removal, because everything shifts left while `i` still advances. → 
  `list.RemoveAll(x => x.IsExpired)` — O(n) total and correct. (Or iterate
  backwards.)

**E29.3**
- *Structures:* `Dictionary<TKey, LinkedListNode<CacheEntry>>` + a **doubly** linked
  list ordered most-recent-first.
- *Jobs:* the dictionary gives O(1) key → node; the linked list gives O(1) removal
  and re-insertion at the front.
- *Why not a `List<T>`:* removing from the middle is O(n).
- *Why not the dictionary alone:* it has no notion of order, so it cannot tell you
  what is least recently used.
- *The value type:* it must be `LinkedListNode<T>`, not `T` — holding the **node**
  is what makes `list.Remove(node)` O(1). Storing the value alone forces an O(n)
  `Find`.
- *Production:* `MemoryCache` with a size limit — it also gives you expiry,
  eviction callbacks, thread safety, and metrics.

**E29.4**
- *What happens:* concurrent writes can corrupt `Dictionary`'s internal bucket
  chains. The documented failure is not just a lost update — a corrupted chain can
  make a subsequent **read spin forever**, hanging the thread. That is the
  production hang.
- *Fix 1:* `lock (_gate) { ... }` around the read-modify-write.
- *Fix 2:* `ConcurrentDictionary` with `AddOrUpdate(key, 1, (_, old) => old + 1)`.
- *Fix 3:* per-thread or per-request counters aggregated at the end — no shared
  mutable state, no contention. (Or use the metrics library, which does this.)
- *Why the indexer is still wrong on `ConcurrentDictionary`:* `d[k] = d[k] + 1` is
  three separate atomic operations, not one — two threads can both read 5 and both
  write 6. `AddOrUpdate` / `GetOrAdd` perform the update atomically.

**E29.5**
1. Add `StringComparer.Ordinal` (states intent, faster) and a capacity if known.
2. If node ids are dense ints, `bool[]` beats it. Otherwise fine — pre-size it.
3. Return `IReadOnlyList<Order>` so callers cannot mutate your internal state.
4. `Channel<T>` (bounded) — async consumption, backpressure, completion
   signalling. A raw `Queue` needs a lock and gives you none of that.
5. `CustomerId` as a `class` uses **reference equality** by default — two equal ids
   are different keys. Make it a `record` (or `readonly record struct`), or
   implement `Equals`/`GetHashCode`, or supply an `IEqualityComparer`.
