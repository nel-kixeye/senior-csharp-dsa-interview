# Book 08 — SortedSet / SortedDictionary

> The book of *"sorted, and still changing."*

## 1. What problem does this book solve?

Maintaining **order** through **mutation**. If you insert, delete, and query
order-sensitive facts in an interleaved way, sorting an array repeatedly is
O(n log n) per change; a balanced tree is O(log n).

Both types are red-black trees. `SortedSet<T>` stores unique keys;
`SortedDictionary<K,V>` stores unique keys with payloads.

## 2. Signals

- "Unique **and** sorted"
- "Maintain sorted order as items arrive"
- "Largest value smaller than X" / "smallest value greater than X"
  (predecessor / successor)
- "Ceiling" / "floor" / "next closest"
- "Values within a range" / "between low and high"
- "The current minimum and maximum, with insertions in between"
- "Rank" / "order statistics" over a mutating set
- Interval / calendar booking where you must find a neighbouring booking (22)

**The tell:** you need *ordered* queries and the collection **changes**. If it
does not change, sort an array and binary search it — cheaper and simpler.

## 3. The naive instinct

```csharp
var list = new List<int>();
foreach (var x in stream)
{
    list.Add(x);
    list.Sort();                      // O(n log n) per insertion -> O(n^2 log n)
    Console.WriteLine(list[0]);
}
```

Or scanning the whole collection to find the nearest neighbour each time — O(n)
per query.

## 4. Why that is inferior

Re-sorting after every insert is catastrophic and surprisingly common. A tree
gives O(log n) insert while *never* being unsorted.

The subtler win is **predecessor/successor**. A `HashSet` cannot answer "what is
the closest value below X" at all — it has no order. A sorted array can, via
binary search, but only if it is not changing. The tree does both.

## 5. What to recognize

```csharp
var set = new SortedSet<int>();
set.Add(5); set.Add(1); set.Add(3);
// iterates 1, 3, 5
int min = set.Min, max = set.Max;      // O(log n)

// Range query — the killer feature
var between = set.GetViewBetween(2, 4);   // a live VIEW, O(log n) to obtain

// Successor: smallest element >= x
var succ = set.GetViewBetween(x, set.Max);
int? s = succ.Count > 0 ? succ.Min : null;

var dict = new SortedDictionary<string, int>();
foreach (var (k, v) in dict) { }       // iterated in key order
```

`GetViewBetween` returns a **view, not a copy** — obtaining it is O(log n), and
mutating the view mutates the underlying set. Enumerating it is O(k) in the
number of items yielded.

Custom ordering, including descending:

```csharp
var desc = new SortedSet<int>(Comparer<int>.Create((a, b) => b.CompareTo(a)));
var byLen = new SortedSet<string>(Comparer<string>.Create(
    (a, b) => a.Length != b.Length ? a.Length.CompareTo(b.Length)
                                   : string.CompareOrdinal(a, b)));
```

That tie-breaker matters: **the comparer defines uniqueness**. If your comparer
returns 0 for two different items, the set treats them as duplicates and drops
one. This is the number-one SortedSet bug.

## 6. Complexity

| Operation | SortedSet / SortedDictionary | HashSet / Dictionary |
|---|---|---|
| Add | O(log n) | O(1) avg |
| Contains | O(log n) | O(1) avg |
| Remove | O(log n) | O(1) avg |
| Min / Max | O(log n) | O(n) scan |
| Predecessor / successor | O(log n) | impossible |
| In-order iteration | O(n), already sorted | O(n log n) — must sort |

Space O(n), with meaningfully higher per-node overhead than a hash structure
(colour bit, two child pointers, parent).

**`SortedList<K,V>` is a different trade**: array-backed, so O(n) insert but
O(log n) lookup, less memory, and much faster iteration. Choose it for
build-once/read-many; choose `SortedDictionary` for insert-heavy workloads.

## 7. C# APIs

```csharp
// SortedSet
set.Add(x); set.Remove(x); set.Contains(x);
set.Min; set.Max; set.Count;
set.GetViewBetween(lo, hi);
set.Reverse();                      // IEnumerable in descending order
set.UnionWith / IntersectWith / ExceptWith / SymmetricExceptWith;
set.RemoveWhere(predicate);

// SortedDictionary
d[key] = v; d.TryGetValue(key, out var v2); d.ContainsKey(k);
d.Keys;    // sorted
d.Values;  // in key order
d.Remove(k);

// SortedList — array-backed alternative
var sl = new SortedList<string, int>();
sl.IndexOfKey(k);                   // O(log n)
sl.Keys[i];                          // indexed access, which the tree lacks
```

## 8. Common mistakes

1. **A comparer that returns 0 for distinct items** — silent data loss.
2. **Mutating a key after insertion.** The tree's invariant breaks; lookups fail
   for items that are present.
3. **Using a sorted structure when insertion order never interleaves with
   queries.** Sort an array once instead.
4. **Assuming O(1).** It is O(log n). For pure membership on hot paths, HashSet
   is meaningfully faster.
5. **`GetViewBetween` bounds confusion** — both ends are inclusive.
6. **Expecting indexed access** on `SortedSet`/`SortedDictionary`. There is
   none; `SortedList` has it.
7. **Choosing `SortedDictionary` for a build-once lookup** where `SortedList` or
   a sorted array + binary search would be faster and leaner.

## 9. Correct-book problems

- Contains Duplicate III — value within t **and** index within k (`GetViewBetween`)
- My Calendar I / II / III — booking with overlap detection (22)
- Data Stream as Disjoint Intervals
- Sliding Window Median (a multiset workaround; .NET lacks a multiset)
- Count of Smaller Numbers After Self (or use a BIT / merge sort)
- Exam Room, Seat Reservation Manager
- Task scheduling with ordered deadlines
- Any "find the nearest booked slot" calendar logic

## 10. Where it looks right but is wrong

- **Membership only, no ordering.** → HashSet (01). O(1) beats O(log n).
- **You need the min repeatedly but never the successor.** → PriorityQueue (07):
  simpler, better constants.
- **The data is static.** → sort an array once, then binary search (12, 21).
- **You need duplicates.** `SortedSet` drops them. .NET has **no multiset** —
  emulate with `SortedDictionary<T,int>` counting occurrences, or a
  `SortedSet<(value, uniqueTag)>`. This trips people constantly.
- **Counting frequency in sorted order** — `Dictionary` then sort the results
  once is usually cheaper than maintaining a sorted structure throughout.
- **You need rank / "how many are smaller"** — red-black trees in .NET do not
  expose order statistics. Use a Fenwick tree (BIT) or merge-sort counting.

---

## Production Lens

Ask honestly whether the ordering is needed *during* the computation or only in
the *output*. Ordering only at the end means `Dictionary` + one `OrderBy`, which
is faster and clearer than paying O(log n) on every write.

`ImmutableSortedSet`/`ImmutableSortedDictionary` exist for shared, concurrently
read state. `SortedList<K,V>` is the memory-efficient choice for configuration
tables read far more often than written.

**Related:** [[Book01-HashSet]], [[Book02-Dictionary]],
[[Book07-PriorityQueue]], [[Book12-BinarySearch]], [[Book21-Sorting]],
[[Book22-Intervals]], [[Book29-Collections]].
