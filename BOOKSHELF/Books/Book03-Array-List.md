# Book 03 — Array and List&lt;T&gt;

> The book of *"I need order and position."*

Not "the thing that stores items." Everything stores items. This book is about
**when indexed, contiguous, ordered storage is the right answer** — and about
knowing the cost of every operation you casually perform on it.

## 1. What problem does this book solve?

Sequential data where **position carries meaning** and **random access by index
is needed**. Contiguity buys cache locality, which is why arrays beat
theoretically-equal structures in practice by large constants.

## 2. Signals

- "The i-th element" / "index" / "position"
- "In order" / "preserve the original order"
- "Sequence" / "series" / "the array"
- Fixed, known size → **array**
- Unknown or growing size → **`List<T>`**
- Result is "return the array/list of…" → `List<T>` then `ToArray()`
- Two-pointer, sliding-window, prefix-sum, binary-search work → all want
  contiguous indexed storage underneath

**Counter-signal:** if you never use an index and only ever ask "is it in
there?", you did not want a list. You wanted a set (01).

## 3. The naive instinct

Using `List<T>` for everything, and treating all its methods as free.

```csharp
var list = new List<int>();
foreach (var x in source)
    if (!list.Contains(x))        // O(n) each time -> O(n^2) total
        list.Add(x);

list.Insert(0, item);             // O(n): shifts every element
list.RemoveAt(0);                 // O(n): shifts every element
```

## 4. Why that is inferior

`List<T>` is an **array behind a pointer**. Anything touching the front or the
middle shifts memory. The API hides an O(n) memmove behind a one-word call, and
in a loop that is O(n^2) with no visual warning.

`Contains` is a linear scan. `IndexOf` is a linear scan. `Remove(item)` is a
linear scan *plus* a shift.

## 5. What to recognize

| Need | Structure |
|---|---|
| Fixed size, known at construction | `T[]` |
| Growing, append-mostly | `List<T>` |
| Add/remove at the **front** | `Queue<T>` (05) — not `List` |
| Add/remove at the **back only** | `Stack<T>` (04) or `List<T>` |
| Frequent middle insertion with a held reference | `LinkedList<T>` (06) |
| Grid / matrix | `T[,]` (rectangular) or `T[][]` (jagged) |
| Read-only view without copying | `ReadOnlySpan<T>` (31) |
| Never mutated after build | `ImmutableArray<T>` / `T[]` |

## 6. Complexity

| Operation | `T[]` | `List<T>` |
|---|---|---|
| `arr[i]` read/write | O(1) | O(1) |
| `Add` (append) | n/a | **amortized O(1)** |
| `Insert(0, x)` | n/a | **O(n)** |
| `Insert(mid, x)` | n/a | **O(n)** |
| `RemoveAt(last)` | n/a | O(1) |
| `RemoveAt(0)` | n/a | **O(n)** |
| `Remove(item)` | n/a | **O(n)** (search + shift) |
| `Contains` / `IndexOf` | O(n) | **O(n)** |
| `Sort` | O(n log n) | O(n log n) |
| `BinarySearch` (sorted) | O(log n) | O(log n) |
| `Length` / `Count` | O(1) | O(1) |

**Amortized O(1) Add**: `List<T>` doubles capacity when full, copying
everything. Any single `Add` can be O(n); the average is O(1). If you know the
final size, `new List<T>(capacity)` eliminates every copy.

Space: O(n), but a `List<T>` can hold up to 2x its `Count` in capacity. For
long-lived large lists, `TrimExcess()` or `ToArray()`.

## 7. C# APIs worth knowing cold

```csharp
// Array
int[] a = new int[n];
Array.Sort(a);  Array.Reverse(a);  Array.Fill(a, -1);
Array.IndexOf(a, x);  Array.BinarySearch(a, x);   // sorted only
Array.Copy(src, dst, len);  Array.Clear(a);
int[] b = a[2..5];             // range operator, allocates
a.AsSpan(2, 3);                // no allocation (31)

// List
var l = new List<int>(capacity);
l.Add(x); l.AddRange(other); l.Insert(i, x);
l.RemoveAt(i); l.Remove(x); l.RemoveAll(p => p < 0);   // RemoveAll is O(n) total
l.Sort(); l.Sort((x, y) => y.CompareTo(x)); l.Reverse();
l.BinarySearch(x);             // sorted only; negative = ~insertionPoint
l.Contains(x); l.IndexOf(x); l.LastIndexOf(x);
l.Find(p); l.FindIndex(p); l.Exists(p); l.TrueForAll(p);
l.GetRange(i, count); l.ToArray();
CollectionsMarshal.AsSpan(l);  // zero-copy span over the backing array
```

`l.BinarySearch(x)` returning a negative value is genuinely useful: `~result` is
the index where `x` *would* be inserted. That is a lower-bound query for free
(12).

`RemoveAll(predicate)` is O(n) **total** — vastly better than removing in a loop.
Removing inside a `for` loop while iterating forward is both O(n^2) and a
skipped-element bug.

## 8. Common mistakes

1. **`Contains` in a loop.** → HashSet (01).
2. **`Insert(0, x)` / `RemoveAt(0)` in a loop.** → `Queue<T>` (05), or build
   backwards and `Reverse()` once.
3. **Removing while iterating forward.** Skips elements. Iterate backwards, or
   `RemoveAll`.
4. **Not pre-sizing** a list whose size you know.
5. **`BinarySearch` on unsorted data** — returns garbage, no error.
6. **Off-by-one on `Length` vs `Count`** (arrays vs lists) and on `< n` vs
   `<= n`. The eternal tax.
7. **Assuming `List<T>` is thread-safe.** It is not, even for reads concurrent
   with writes.
8. **Returning `List<T>` from a public API** when the caller should not mutate
   it — expose `IReadOnlyList<T>`.
9. **Jagged vs rectangular confusion**: `T[,]` cannot be row-sliced or
   LINQ'd naturally; `T[][]` can, and rows may differ in length.

## 9. Problems where this is the correct book

- Rotate Array (reversal trick, in place)
- Move Zeroes, Remove Duplicates from Sorted Array — read/write pointers (09)
- Product of Array Except Self — prefix/suffix passes
- Plus One, Merge Sorted Array (fill from the back)
- Spiral Matrix, Rotate Image — boundary index discipline
- Best Time to Buy and Sell Stock — single pass tracking a running min
- Any problem that then feeds Two Pointers / Sliding Window / Prefix Sum

## 10. Where List looks right but is wrong

- **Membership testing** → HashSet (01)
- **Counting** → Dictionary (02)
- **FIFO** → Queue (05). `RemoveAt(0)` is the classic O(n^2) trap.
- **Repeated min/max extraction** → PriorityQueue (07)
- **Maintaining sorted order under insertion** → SortedSet (08). Re-sorting a
  list after each insert is O(n^2 log n).
- **Fixed small key space** (26 letters, 10 digits) → a plain array indexed by
  `c - 'a'`, not a `List` and not a Dictionary.
- **You never index and never mutate** → `IEnumerable<T>` may be all you need,
  and may let you stream instead of materialize.

---

## Production Lens

- **Return type matters more than storage type.** `IReadOnlyList<T>` or
  `IEnumerable<T>` at API boundaries; `List<T>` internally.
- **`ToList()` in a LINQ chain forces materialization** — sometimes necessary
  (avoiding repeated enumeration of an expensive source), often wasteful. Know
  which you are doing. Calling `.ToList()` reflexively at the end of every query
  is a habit worth breaking.
- **Multiple enumeration** of an `IEnumerable` backed by a query re-executes it.
  If the source is a database or a generator, that is a real bug.
- **Capacity and LOH**: arrays over 85,000 bytes land on the Large Object Heap.
  For big buffers, `ArrayPool<T>.Shared.Rent/Return` (31).
- **`CollectionsMarshal.AsSpan(list)`** gives a zero-copy span for hot loops —
  but it is invalidated by any structural change to the list.

**Related:** [[Book01-HashSet]], [[Book05-Queue]], [[Book09-TwoPointers]],
[[Book29-Collections]], [[Book31-Span-Memory]].
