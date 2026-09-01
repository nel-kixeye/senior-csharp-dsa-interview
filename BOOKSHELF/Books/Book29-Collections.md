# Book 29 — C# Collection Reference

> The book of *"reach for this when / do NOT reach for this when."*

The mental reference card. Every collection, one paragraph each, phrased as the
decision rather than the definition.

## The one-line decision table

| Collection | Reach for it when | Do NOT reach for it when |
|---|---|---|
| `T[]` | Size is fixed and known; you need max speed and locality; a small dense index space | The size changes; you need insert/remove |
| `List<T>` | Growing, append-mostly, index access, order matters | You need membership tests (O(n)); you insert/remove at the front |
| `HashSet<T>` | "Have I seen this?"; uniqueness; set algebra; `visited` | You need order, counts, or a payload |
| `Dictionary<K,V>` | Key → value; counting; grouping; memoization | Presence alone (use HashSet); keys are dense ints (use an array) |
| `Queue<T>` | FIFO; BFS; arrival-order processing | LIFO; you need indexing or priority |
| `Stack<T>` | LIFO; nesting; undo; DFS; backtracking | FIFO; shortest paths |
| `LinkedList<T>` | O(1) removal **given a node reference**; LRU internals | You do not hold node references; you iterate a lot |
| `SortedSet<T>` | Unique **and** sorted; predecessor/successor; range views | Membership only (HashSet is O(1)); duplicates needed |
| `SortedDictionary<K,V>` | Key → value **in key order**; insert-heavy | Order does not matter; build-once/read-many (use SortedList) |
| `SortedList<K,V>` | Sorted, built once, read/iterated often; memory-tight; needs indexing | Insert-heavy (O(n) per insert) |
| `PriorityQueue<T,P>` | Repeatedly need the min/max; top-K; Dijkstra; scheduling | You need all items sorted; you need lookup or removal by value |

## Complexity at a glance

| | Index | Search | Insert | Delete | Ordered? |
|---|---|---|---|---|---|
| `T[]` | O(1) | O(n) | — | — | insertion |
| `List<T>` | O(1) | O(n) | O(1) end / O(n) mid | O(n) | insertion |
| `HashSet<T>` | — | **O(1)** | O(1) | O(1) | **no** |
| `Dictionary<K,V>` | — | **O(1)** | O(1) | O(1) | **no** |
| `Queue<T>` | — | O(n) | O(1) | O(1) | FIFO |
| `Stack<T>` | — | O(n) | O(1) | O(1) | LIFO |
| `LinkedList<T>` | O(n) | O(n) | **O(1)*** | **O(1)*** | insertion |
| `SortedSet<T>` | — | O(log n) | O(log n) | O(log n) | **sorted** |
| `SortedDictionary<K,V>` | — | O(log n) | O(log n) | O(log n) | **sorted** |
| `SortedList<K,V>` | O(1) | O(log n) | O(n) | O(n) | **sorted** |
| `PriorityQueue<T,P>` | — | — | O(log n) | O(log n) peek/dequeue | by priority |

\* given a node reference; O(n) to find it.

## The decision flowchart

```
Do I need key → value?
├─ YES → Do I need keys in sorted order?
│        ├─ NO  → Dictionary<K,V>
│        └─ YES → Insert-heavy?  → SortedDictionary
│                 Read-heavy?    → SortedList  (or sorted array + binary search)
└─ NO  → Do I need uniqueness?
         ├─ YES → Need sorted order / range queries?
         │        ├─ NO  → HashSet<T>
         │        └─ YES → SortedSet<T>
         └─ NO  → What governs the order I take things out?
                  ├─ Arrival order (FIFO)     → Queue<T>
                  ├─ Most recent (LIFO)       → Stack<T>
                  ├─ Priority / extreme value → PriorityQueue<T,P>
                  ├─ By index / position      → List<T> or T[]
                  └─ O(1) removal by node ref → LinkedList<T>
```

## Per-collection notes

**`T[]`** — Fastest, most cache-friendly, fixed size. For a small dense key
space (26 letters, 10 digits, 0..n-1 node ids) an array beats a Dictionary on
every axis including readability. Arrays over 85,000 bytes go on the Large
Object Heap; use `ArrayPool<T>` for large temporary buffers (31).

**`List<T>`** — An array behind a pointer. `Add` is amortized O(1); everything
touching the front or middle is O(n). Pre-size with `new List<T>(capacity)` when
you know the count. `CollectionsMarshal.AsSpan(list)` gives a zero-copy view for
hot loops.

**`HashSet<T>`** — Learn `Add`'s bool return as the "already seen" idiom. Custom
types need `Equals`/`GetHashCode` (or a `record`). String keys deserve an
explicit `StringComparer`.

**`Dictionary<K,V>`** — Prefer `TryGetValue` over `ContainsKey` + indexer (one
lookup instead of two). `GetValueOrDefault` for counting.
`CollectionsMarshal.GetValueRefOrAddDefault` when a single hash is worth it.
Enumeration order is undefined — do not depend on it.

**`Queue<T>`** — Circular buffer; O(1) dequeue. The correctness point: BFS needs
a queue, and substituting a stack gives wrong distances, not slow ones.

**`Stack<T>`** — Enumerates **top-first**, which surprises people. Prefer
`TryPop`/`TryPeek` over the throwing versions.

**`LinkedList<T>`** — The only BCL collection with O(1) removal at a held
reference, and the only reason to choose it. Poor cache locality otherwise.
Also the stand-in for a deque, since .NET has none (23).

**`SortedSet<T>` / `SortedDictionary<K,V>`** — Red-black trees. `GetViewBetween`
is the range-query feature that justifies `SortedSet`. **Your comparer defines
equality** — returning 0 for distinct items silently drops data.

**`SortedList<K,V>`** — Array-backed: O(n) insert, less memory, faster
iteration, and it supports indexing (`Keys[i]`). The right choice for
configuration tables loaded once.

**`PriorityQueue<T,P>`** — .NET 6+. **Min-heap**; negate or supply a comparer
for max. `UnorderedItems` is genuinely unordered. No priority updates — use lazy
deletion in Dijkstra.

## Specialized and production types

| Type | Use for |
|---|---|
| `ConcurrentDictionary<K,V>` | Thread-safe map; `GetOrAdd`, `AddOrUpdate` |
| `ConcurrentQueue/Stack/Bag<T>` | Lock-free concurrent collections |
| `BlockingCollection<T>` | Producer/consumer with blocking (older style) |
| `Channel<T>` | **Modern** async producer/consumer with backpressure |
| `ImmutableArray/List/Dictionary` | Shared state, safe concurrent reads |
| `FrozenDictionary/FrozenSet` | .NET 8+; build once, read millions of times |
| `ReadOnlyCollection<T>` / `IReadOnlyList<T>` | API surfaces that must not be mutated |
| `BitArray` / `BitVector32` | Large or packed boolean sets (25) |
| `ArraySegment<T>` / `Memory<T>` / `Span<T>` | Slices without copying (31) |
| `ILookup<K,V>` (`ToLookup`) | Immutable one-to-many; missing keys yield empty |

## Common mistakes

1. **`List.Contains` in a loop** — the canonical O(n^2). → HashSet.
2. **`List.RemoveAt(0)` as a dequeue** — O(n^2). → Queue.
3. **`Dictionary<T,bool>`** — you wanted a HashSet.
4. **Dictionary keyed by dense small ints** — you wanted an array.
5. **Mutable keys** in any hash or tree structure — the entry becomes
   unreachable.
6. **Missing `GetHashCode`/`Equals`** on custom key types (use `record`).
7. **Depending on enumeration order** of `HashSet`/`Dictionary`.
8. **Not pre-sizing** collections whose size is known.
9. **Returning `List<T>`** from a public API when the caller should not mutate.
10. **Assuming thread safety.** None of the non-concurrent collections are safe
    for concurrent write; a `Dictionary` under concurrent writes can corrupt and
    **infinite-loop on read**, which is a real production hang.

## Interview vs production

| Interview | Production |
|---|---|
| `new Dictionary<K,V>()` | `+ StringComparer.Ordinal`, `+ capacity` |
| `new HashSet<T>()` | `ToFrozenSet()` if build-once/read-forever |
| `List<T>` return type | `IReadOnlyList<T>` on public APIs |
| `Queue<T>` for a pipeline | `Channel<T>` with bounded capacity |
| Ignore threading | `ConcurrentDictionary` or explicit locking |
| Ignore allocation | `ArrayPool`, `Span`, pre-sizing |

## The one question

> **What operation will I perform most often, and which collection makes that
> operation O(1)?**

Answer that and the choice is made.

**Related:** [[Book01-HashSet]], [[Book02-Dictionary]], [[Book03-Array-List]],
[[Book04-Stack]], [[Book05-Queue]], [[Book06-LinkedList]],
[[Book07-PriorityQueue]], [[Book08-SortedSet-SortedDictionary]],
[[Book31-Span-Memory]].
