# Book 21 — Sorting

> The book of *"would sorting make everything else obvious?"*

## 1. What problem does this book solve?

Sorting is rarely the answer by itself. It is the **enabler** — the O(n log n)
investment that makes two pointers, greedy, binary search, grouping, and
interval logic all possible. Its real value on this shelf is as a question you
ask early:

> **If this data were sorted, would the problem become easy?**

If yes, sort. The n log n is almost always affordable.

## 2. Signals

- "Sorted" appears anywhere in the statement or the desired output
- "Kth largest / smallest" (though a heap may be better, 07)
- "Find pairs / triplets" → sort, then two pointers (09)
- "Group identical / anagram / equivalent items" → sort each key
- "Intervals" → sort by start or end (22)
- "Merge" two or more ordered sequences
- "Median" / "percentile" / "rank"
- "Closest" / "nearest" values
- "Duplicates in sorted data" become adjacent — one pass finds them
- Greedy problems, essentially all of them (20)
- "Minimum difference between any two elements" — only adjacent pairs matter
  after sorting

**The tell:** the problem involves comparisons between *arbitrary* pairs. Sorting
converts "compare everything to everything" into "compare neighbours."

## 3. The naive instinct

Nested loops comparing every pair:

```csharp
// Minimum absolute difference between any two elements
int best = int.MaxValue;
for (int i = 0; i < n; i++)
    for (int j = i + 1; j < n; j++)
        best = Math.Min(best, Math.Abs(a[i] - a[j]));    // O(n^2)
```

## 4. Why that is inferior

After sorting, the closest pair must be **adjacent** — so one pass over
neighbours suffices:

```csharp
Array.Sort(a);
int best = int.MaxValue;
for (int i = 1; i < n; i++) best = Math.Min(best, a[i] - a[i - 1]);   // O(n log n)
```

That is the pattern in miniature: sorting imposes structure, and structure
eliminates comparisons. The O(n^2) was spending its time confirming things the
ordering already tells you.

## 5. What to recognize

**Sorting as a precondition** — what it unlocks:

| After sorting, you can | Book |
|---|---|
| Two-pointer pair search | 09 |
| Binary search | 12 |
| Greedy interval selection | 20, 22 |
| Adjacent-duplicate detection | — |
| Grouping equal keys by scanning | 02 |
| Merging sequences | 09 |
| Median by index | — |

**Sorting by a derived key** — often the actual insight:

```csharp
// Group anagrams: the sorted word is the group key
var key = new string(word.OrderBy(c => c).ToArray());

// Sort by a custom rule
Array.Sort(people, (a, b) => a.Age != b.Age
                              ? a.Age.CompareTo(b.Age)
                              : string.CompareOrdinal(a.Name, b.Name));

// Sort strings numerically rather than lexicographically
var nums = strs.OrderBy(int.Parse).ToArray();
```

**Counting sort** — when the value range is small and n is large, O(n + k) beats
O(n log n):

```csharp
// Sort Colors (values 0,1,2), or any bounded alphabet
var counts = new int[3];
foreach (var v in nums) counts[v]++;
int idx = 0;
for (int v = 0; v < 3; v++)
    for (int j = 0; j < counts[v]; j++) nums[idx++] = v;
```

Recognizing that a bounded value range permits linear-time sorting is a genuine
senior signal — "sort" does not have to mean "comparison sort."

**Quickselect** — Kth element without a full sort, O(n) average:
worth naming when asked for "Kth largest" and you want to beat O(n log n).

## 6. Complexity

| Algorithm | Average | Worst | Space | Stable |
|---|---|---|---|---|
| `Array.Sort` (introsort) | O(n log n) | O(n log n) | O(log n) | **No** |
| `OrderBy` (LINQ, merge-ish) | O(n log n) | O(n log n) | **O(n)** | **Yes** |
| `List.Sort` | O(n log n) | O(n log n) | O(log n) | No |
| Counting sort | O(n + k) | O(n + k) | O(k) | Yes |
| Quickselect (Kth) | **O(n)** | O(n^2) | O(1) | — |
| Heap / PriorityQueue for top K | O(n log k) | | O(k) | — |

The stability difference between `Array.Sort` and `OrderBy` is the one that
causes real bugs — see mistakes below.

## 7. C# APIs

```csharp
Array.Sort(a);
Array.Sort(a, comparison);
Array.Sort(keys, items);                 // sort two parallel arrays together
Array.Sort(a, index, length);
Array.Reverse(a);

list.Sort();  list.Sort(comparison);
var q = items.OrderBy(x => x.A).ThenByDescending(x => x.B);   // stable
var d = items.OrderByDescending(x => x.Score);

// Comparer construction
Comparer<T>.Create((a, b) => ...);
StringComparer.OrdinalIgnoreCase;

// Sort a string's characters
var sorted = new string(word.OrderBy(c => c).ToArray());
```

`OrderBy` is **deferred** — it does nothing until enumerated, and it re-sorts on
every enumeration. `.ToList()` it if you enumerate more than once.

## 8. Common mistakes

1. **Subtraction comparators**: `(a, b) => a - b` overflows. Use `CompareTo`.
2. **Assuming `Array.Sort` is stable.** It is not. Equal elements can be
   reordered, which silently breaks multi-key sorting done in passes. Use
   `OrderBy`/`ThenBy` when stability matters.
3. **Sorting when you need original indices.** Sort `(value, index)` pairs
   instead, or use a Dictionary (02).
4. **Sorting inside a loop** — O(n^2 log n). Sort once, or use SortedSet (08).
5. **Sorting the whole array for the top K** — O(n log n) vs O(n log k) (07).
6. **`OrderBy` in a hot path** — it allocates a full buffer plus keys.
7. **Culture-sensitive string sorting** where ordinal was intended. `"a"` vs
   `"A"` ordering differs by culture; `StringComparer.Ordinal` is deterministic.
8. **Sorting a `List<T>` you exposed publicly** — you just mutated the caller's
   data.
9. **Comparator that is not a total order** (inconsistent or non-transitive) —
   `Array.Sort` throws `InvalidOperationException` or produces garbage.

## 9. Correct-book problems

- Merge Intervals; Non-overlapping Intervals; Meeting Rooms (22)
- Group Anagrams — sorted string as the key
- 3Sum; 4Sum; Two Sum II — sort then two pointers (09)
- Largest Number — custom comparator on concatenation order
- Sort Colors — counting sort / Dutch national flag
- Kth Largest Element — quickselect or heap
- Top K Frequent Words — count then sort by (count desc, word asc)
- Minimum Absolute Difference; Array Partition
- H-Index; Car Fleet
- Relative Sort Array; Custom Sort String
- Wiggle Sort; Pancake Sorting

## 10. Where Sorting looks right but is wrong

- **O(n) is required.** Sorting is O(n log n) — a HashSet or Dictionary keeps it
  linear (01, 02).
- **You need only the min/max, or the top K** → one pass, or a heap (07).
- **Original order matters** and you did not preserve indices.
- **The data is already sorted** — check before spending n log n.
- **You need order *maintained* through insertions** → SortedSet (08).
- **Only the Kth element is wanted** → quickselect, O(n) average.
- **The value range is tiny** → counting sort, O(n + k).
- **Streaming data** — you cannot sort what you cannot hold; use a heap (07).

---

## Production Lens

Two habits separate production sorting from interview sorting.

**Sort at the right layer.** If the data comes from a database, `ORDER BY` in
SQL uses an index and sorts before transfer. Pulling 100,000 rows to sort them
in memory is the wrong layer.

**Be explicit about the comparer.** Default string ordering in .NET is culture-
sensitive for some APIs and ordinal for others, and the difference produces
data that sorts differently on different machines. `StringComparer.Ordinal` for
identifiers, `InvariantCulture` for stable display order, current culture only
for user-facing text you intend to be locale-aware.

**Related:** [[Book09-TwoPointers]], [[Book12-BinarySearch]],
[[Book20-Greedy]], [[Book22-Intervals]], [[Book07-PriorityQueue]],
[[Book27-LINQ]].
