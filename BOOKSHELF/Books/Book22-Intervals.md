# Book 22 — Intervals

> The book of *"start, end, and whether they collide."*

## 1. What problem does this book solve?

Reasoning about ranges — time slots, numeric spans, bookings, segments. Interval
problems are a small, well-defined family, and almost all of them are solved by
**sorting by the right endpoint and making one pass**.

Once you recognize the family, the work is choosing the sort key.

## 2. Signals

- "Start" and "end" / "begin" and "finish"
- "Meetings" / "bookings" / "reservations" / "appointments"
- "Overlapping" / "conflict" / "double-booked" / "collision"
- "Merge" ranges
- "How many rooms / resources / workers are needed?"
- "Insert a new interval"
- "Free time" / "gaps" / "availability"
- Ranges given as `[start, end]` pairs
- "Timeline" / "schedule"
- "Minimum number of X to cover / remove"

**The tell:** the input is pairs, and the question is about how they relate on a
line.

## 3. The naive instinct

Comparing every interval against every other:

```csharp
for (int i = 0; i < n; i++)
    for (int j = i + 1; j < n; j++)
        if (Overlaps(intervals[i], intervals[j])) ...     // O(n^2)
```

Or trying to merge without sorting, which requires repeated rescans as merges
create new overlaps.

## 4. Why that is inferior

Sorting by start reduces overlap checking to a **local** question: after
sorting, an interval can only overlap the one immediately before it in the
merged output. That collapses O(n^2) into O(n log n), dominated by the sort.

Without sorting, merging is genuinely hard — each merge can create a new overlap
with something you already passed, so you need repeated passes.

## 5. What to recognize

**Overlap test** — get this right once and it stops being a source of bugs:

```csharp
bool Overlaps(int[] a, int[] b) => a[0] < b[1] && b[0] < a[1];   // half-open [start, end)
bool OverlapsInclusive(int[] a, int[] b) => a[0] <= b[1] && b[0] <= a[1];
```

Whether touching endpoints (`[1,2]` and `[2,3]`) count as overlapping is a
**clarifying question to ask in the interview**. For meetings they usually do
not; for merging ranges they usually do.

**Merge overlapping intervals** — sort by start:

```csharp
Array.Sort(intervals, (a, b) => a[0].CompareTo(b[0]));
var merged = new List<int[]>();
foreach (var iv in intervals)
{
    if (merged.Count > 0 && iv[0] <= merged[^1][1])
        merged[^1][1] = Math.Max(merged[^1][1], iv[1]);   // extend
    else
        merged.Add(new[] { iv[0], iv[1] });               // disjoint: start new
}
```

`Math.Max` matters: the next interval may be entirely *contained* in the current
one, and blindly assigning `iv[1]` would shrink it.

**Minimum rooms / max concurrency** — two idioms, both worth knowing:

```csharp
// (a) Heap of end times (07)
Array.Sort(intervals, (a, b) => a[0].CompareTo(b[0]));
var ends = new PriorityQueue<int, int>();
foreach (var iv in intervals)
{
    if (ends.Count > 0 && ends.Peek() <= iv[0]) ends.Dequeue();   // room freed
    ends.Enqueue(iv[1], iv[1]);
}
return ends.Count;

// (b) Sweep line — often simpler and faster
var events = new List<(int time, int delta)>();
foreach (var iv in intervals) { events.Add((iv[0], +1)); events.Add((iv[1], -1)); }
events.Sort((x, y) => x.time != y.time ? x.time.CompareTo(y.time)
                                       : x.delta.CompareTo(y.delta));  // -1 before +1
int cur = 0, peak = 0;
foreach (var (_, d) in events) { cur += d; peak = Math.Max(peak, cur); }
return peak;
```

The sweep-line tie-break (`-1` before `+1`) encodes "a meeting ending at 10 frees
the room for one starting at 10." Getting that backwards inflates the answer by
one — a classic off-by-one.

**Maximum non-overlapping** — sort by **end** and go greedy (20).

**The sort-key table**, which is the whole book in four rows:

| Goal | Sort by |
|---|---|
| Merge overlapping | start |
| Insert into sorted intervals | already sorted; scan |
| Max non-overlapping / min removals | **end** |
| Min rooms / max concurrency | start + heap of ends, or sweep line |

## 6. Complexity

| Problem | Time | Space |
|---|---|---|
| Merge intervals | O(n log n) | O(n) |
| Insert into sorted intervals | O(n) | O(n) |
| Max non-overlapping (greedy) | O(n log n) | O(1) |
| Min rooms (heap) | O(n log n) | O(n) |
| Sweep line | O(n log n) | O(n) |
| Overlap query on a static set | O(log n) with binary search (12) | O(n) |

Sorting dominates everywhere. Insert-into-sorted is the exception at O(n),
because the input is already ordered.

## 7. C# specifics

```csharp
// Intervals as int[][] (LeetCode style) or as a record (production style)
public readonly record struct Interval(int Start, int End)
{
    public bool Overlaps(Interval o) => Start < o.End && o.Start < End;
    public Interval Merge(Interval o) => new(Math.Min(Start, o.Start), Math.Max(End, o.End));
}

Array.Sort(intervals, (a, b) => a[0].CompareTo(b[0]));
var byEnd = intervals.OrderBy(i => i[1]).ToArray();

merged[^1][1] = ...;        // ^1 is the last element — cleaner than Count - 1

// Real time ranges
var overlaps = aStart < bEnd && bStart < aEnd;   // DateTime works identically
```

For real dates, `DateTime`/`DateOnly` comparisons work the same way (32) — but
watch time zones, which is where real interval bugs live.

## 8. Common mistakes

1. **Not sorting first.**
2. **Sorting by start when the problem needs end** (or vice versa). This single
   choice decides correctness for greedy interval selection.
3. **Assigning `iv[1]` instead of `Math.Max(...)`** when merging — breaks on
   contained intervals.
4. **Inclusive vs exclusive endpoint confusion.** Ask. Then be consistent.
5. **Sweep-line tie-break order wrong** — off-by-one on max concurrency.
6. **Forgetting the empty input** case.
7. **Mutating the input array** when the caller still needs it.
8. **Assuming input is sorted** when the problem does not say so — or *re*-sorting
  input that already is.

## 9. Correct-book problems

- Merge Intervals — the archetype
- Insert Interval — three phases: before, merge, after
- Non-overlapping Intervals — min removals = n minus max non-overlapping
- Meeting Rooms; Meeting Rooms II
- Minimum Number of Arrows to Burst Balloons — max non-overlapping in disguise
- Interval List Intersections — two pointers over two sorted lists (09)
- Employee Free Time — merge all, then take the gaps
- My Calendar I / II / III — SortedDictionary or a sweep (08)
- Car Pooling; Corporate Flight Bookings — difference array (11)
- Data Stream as Disjoint Intervals
- Remove Covered Intervals
- Maximum Population Year — a small sweep line

## 10. Where Intervals look right but are wrong

- **Points, not ranges** — a single timestamp per event is a sorting/counting
  problem, not an interval one.
- **Intervals arrive dynamically and must be queried live** → SortedDictionary
  or an interval tree (08), not a sort-and-scan.
- **Very large coordinate ranges with few intervals** → coordinate compression
  first, then sweep.
- **Overlap counts per point over a huge timeline** → difference array (11),
  cheaper than a heap.
- **Ranges in more than one dimension** (rectangles) — 1D interval logic does
  not generalize directly; you need a 2D sweep or an R-tree.

---

## Production Lens

Interval logic is calendar scheduling, resource booking, rate-limit windows,
feature-flag validity periods, and pricing/discount date ranges. Two things
break in production that never break in interviews:

**Time zones and DST.** "Overlapping" across zones requires a common instant —
compare `DateTimeOffset` or UTC, never local `DateTime` (32).

**Half-open convention.** Use `[start, end)` consistently. It makes adjacency
(`end == nextStart`) unambiguous and eliminates most double-counting bugs. Pick
it once, document it, and never mix conventions in the same codebase.

For heavy interval querying, `NodaTime`'s `Interval` type or a real interval
tree beats hand-rolled code.

**Related:** [[Book21-Sorting]], [[Book20-Greedy]], [[Book07-PriorityQueue]],
[[Book11-PrefixSum]], [[Book08-SortedSet-SortedDictionary]], [[Book32-DateTime]].
