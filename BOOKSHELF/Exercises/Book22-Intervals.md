# Exercises — Book 22: Intervals

**Reach for it when:** start/end pairs, overlap, scheduling, timelines.
**The sort key is the whole decision:** merge → by **start**; max non-overlapping
→ by **end**; min resources → by start + a heap of ends.
**Ask the interviewer:** do touching endpoints count as overlapping?

---

### E22.1 — Merge Intervals
Given a collection of intervals, merge all overlapping ones and return the
non-overlapping result.

- **Constraints:** up to 10⁴ intervals; input is **not** sorted.
- **Target:** O(n log n) time, O(n) space.
- **Edge cases:** one interval fully **contained** in another (the classic bug);
  touching intervals `[1,4]` and `[4,5]` (merge); no overlaps at all; identical
  intervals.
- **Before you code:** write the merge-extend line before anything else, and say
  why a plain assignment of the new end is wrong.

### E22.2 — Insert Interval
Given a list of **already sorted, non-overlapping** intervals and one new
interval, insert it and merge as needed.

- **Constraints:** up to 10⁴ intervals.
- **Target:** **O(n)** time — do not re-sort.
- **Edge cases:** the new interval goes before all others; after all others; swallows
  every existing interval; fits in a gap touching neither neighbour; the input list
  is empty.
- **Before you code:** the input is already sorted, so the answer has three
  distinct phases. Name them in order.

### E22.3 — Meeting Rooms II
Given meeting intervals, return the minimum number of rooms required.

- **Constraints:** up to 10⁴ meetings.
- **Target:** O(n log n) time.
- **Edge cases:** no meetings (0); all meetings at the same time (n rooms); a
  meeting ending exactly when another starts (**one** room suffices); nested
  meetings.
- **Before you code:** two approaches, both O(n log n). Name them. For the sweep
  version, state the tie-break rule between an end event and a start event at the
  same timestamp — and what goes wrong if you get it backwards.

### E22.4 — Interval List Intersections
Given two lists of **sorted, disjoint** intervals, return their intersection.

- **Constraints:** up to 1000 intervals each.
- **Target:** O(n + m) time — do not sort or nest loops.
- **Edge cases:** either list empty; no intersections; intervals touching at a
  single point (`[1,3]` and `[3,5]` → `[3,3]`); one interval spanning many in the
  other list.
- **Before you code:** both lists are sorted, so this is a merge. Given the current
  interval from each list, what is their intersection (one line), and which list do
  you advance?

### E22.5 — Employee Free Time
Given each employee's sorted, non-overlapping working intervals, return the finite
intervals of time when **all** employees are free.

- **Constraints:** up to 50 employees, 100 intervals each.
- **Target:** O(n log n) time.
- **Edge cases:** total overlap (no free time); a single employee; free gaps at
  the very start or end (**excluded** — only finite gaps between busy periods
  count); employees with identical schedules.
- **Before you code:** ignore who owns which interval. What does the problem
  reduce to once you flatten them all together?

---
---

# ⛔ STOP — hints below

---

**E22.1**
- *Skeleton:*
  ```
  Array.Sort(intervals, (a, b) => a[0].CompareTo(b[0]));
  foreach (var iv in intervals)
      if (merged.Count > 0 && iv[0] <= merged[^1][1])
          merged[^1][1] = Math.Max(merged[^1][1], iv[1]);     // <-- Math.Max, not assignment
      else
          merged.Add(new[] { iv[0], iv[1] });
  ```
  Plain assignment breaks when the incoming interval is **contained** in the
  current one — `[1,10]` then `[2,3]` would shrink the result to `[1,3]`.

**E22.2**
- *Three phases:* (1) copy every interval ending **before** the new one starts;
  (2) merge everything that overlaps by taking `min` of starts and `max` of ends,
  then add the merged interval; (3) copy the rest.
- *Skeleton:* one index walking the list, three sequential `while` loops. No sort,
  no heap — O(n).

**E22.3**
- *Heap approach:* sort by start; keep a **min-heap of end times**; for each
  meeting, dequeue if the earliest end `<= ` this start (a room freed), then
  enqueue this end. The heap size at the end is the answer.
- *Sweep approach:* emit `(start, +1)` and `(end, -1)`; sort by time, and on ties
  put **`-1` before `+1`**; track the running maximum.
- *The tie-break:* a meeting ending at 10 frees the room for one starting at 10.
  Reversing the order counts both as concurrent and inflates the answer by one.

**E22.4**
- *Skeleton:*
  ```
  int lo = Math.Max(a[i][0], b[j][0]);
  int hi = Math.Min(a[i][1], b[j][1]);
  if (lo <= hi) result.Add(new[] { lo, hi });      // non-empty intersection
  if (a[i][1] < b[j][1]) i++; else j++;            // advance the one that ends first
  ```
  Advancing the earlier-ending interval is correct because it can have no further
  intersections — everything remaining in the other list starts at or after its end.

**E22.5**
- *Nudge:* Flatten every employee's intervals into one list, merge them (E22.1),
  then the free time is the **gaps between** consecutive merged intervals.
- *Skeleton:* collect all intervals → sort by start → merge → for each adjacent
  pair in the merged result, emit `[prev.end, next.start]`.
- *Watch:* only gaps **between** merged intervals count. There is no free interval
  before the first busy period or after the last — those would be infinite.
