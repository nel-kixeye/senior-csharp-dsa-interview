# Exercises — Book 08: SortedSet / SortedDictionary

**Reach for it when:** you need order **and** the collection is changing;
predecessor/successor; range queries.
**Watch:** your comparer defines equality — returning 0 for distinct items
silently drops data. .NET has **no multiset**.

---

### E08.1 — Contains Duplicate III
Given an array, determine whether there exist two indices `i` and `j` such that
`|i - j| <= indexDiff` and `|nums[i] - nums[j]| <= valueDiff`.

- **Constraints:** up to 10⁵ elements; values may be large enough to overflow
  `int` on subtraction.
- **Target:** O(n log k) time, O(k) space where `k = indexDiff`.
- **Edge cases:** `valueDiff = 0` (exact duplicates only); `indexDiff = 0`
  (impossible); negative values; overflow on `nums[i] - nums[j]`.
- **Before you code:** you need "is there any value in a *range*, among the last
  k elements?" Name the two things you are maintaining simultaneously.

### E08.2 — My Calendar I
Implement `Book(int start, int end)` for a half-open interval `[start, end)`.
Return `true` and record it if it does not overlap any existing booking;
otherwise return `false` and record nothing.

- **Constraints:** up to 1000 calls.
- **Target:** O(log n) per booking.
- **Edge cases:** exactly adjacent bookings (`[10,20)` then `[20,30)` — must
  succeed); a booking fully containing an existing one; identical bookings.
- **Before you code:** to detect an overlap you only need to check **two**
  existing bookings, not all of them. Which two, and what does that require of
  your structure?

### E08.3 — Time Based Key-Value Store
Implement `Set(key, value, timestamp)` and `Get(key, timestamp)` returning the
value with the **largest timestamp ≤ the requested one**, or `""` if none exists.

- **Constraints:** timestamps for a given key are strictly increasing; up to 2·10⁵
  calls.
- **Target:** O(1) set, O(log n) get.
- **Edge cases:** key never set; timestamp earlier than every stored one; exact
  timestamp match; single entry.
- **Before you code:** timestamps arrive in increasing order. Does that mean you
  need a tree at all? Say what cheaper structure that fact permits.

### E08.4 — Data Stream as Disjoint Intervals
Implement `AddNum(int)` and `GetIntervals()`, which returns the stream's values
so far summarized as a sorted list of disjoint intervals.

- **Constraints:** up to 3·10⁴ calls; values may repeat.
- **Target:** O(log n) per add.
- **Edge cases:** a value that merges two existing intervals into one; a
  duplicate value; a value extending an interval at either end; the first value.
- **Before you code:** on adding a value you must find its neighbours to decide
  whether to extend, merge, or create. Which query does that need?

### E08.5 — Sliding Window Median
Given an array and window size `k`, return the median of every window.

- **Constraints:** up to 10⁵ elements; values may be duplicated; watch overflow
  when averaging two ints.
- **Target:** O(n log k).
- **Edge cases:** `k = 1`; `k` equal to the array length; even `k` (average of
  two middles); duplicates within a window; negative values.
- **Before you code:** the two-heap median trick (E07.4) does not support removing
  an arbitrary element. State the problem that creates, then name the .NET-specific
  obstacle to using `SortedSet` here.

---
---

# ⛔ STOP — hints below

---

**E08.1**
- *Nudge:* Keep a sorted window of the last `k` values and ask it a range
  question.
- *Structure:* `SortedSet<long>` holding the last `k` values (use `long` to avoid
  subtraction overflow).
- *Skeleton:* for each `i`, query `set.GetViewBetween(nums[i] - valueDiff, nums[i] + valueDiff)`
  — non-empty means success. Then `set.Add(nums[i])`, and once
  `i >= indexDiff`, `set.Remove(nums[i - indexDiff])` to keep the window at size k.

**E08.2**
- *Nudge:* The only bookings that can overlap yours are the nearest one starting
  before you and the nearest one starting after.
- *Structure:* `SortedDictionary<int start, int end>` (or `SortedList`).
- *Skeleton:* find the predecessor start (its `end` must be `<= start`) and the
  successor start (must be `>= end`). With half-open intervals, `<=` and `>=` are
  correct and make touching bookings legal.

**E08.3**
- *Nudge:* Increasing timestamps means an ordinary `List` is already sorted.
- *Structure:* `Dictionary<string, List<(int ts, string val)>>`.
- *Skeleton:* `Set` appends — O(1). `Get` binary-searches that list for the
  largest `ts <= target` (Book 12's upper-bound, minus one). No tree needed —
  recognizing that is the exercise.

**E08.4**
- *Nudge:* Find the interval starting at or before the new value, and the one
  starting after it.
- *Structure:* `SortedDictionary<int start, int end>`.
- *Skeleton:* four cases — the value is already covered (do nothing); it extends
  the left neighbour; it extends the right neighbour; it bridges both (merge, and
  delete one entry). Handle the merge case explicitly or you will leave
  overlapping intervals behind.

**E08.5**
- *Nudge:* `SortedSet` refuses duplicates, and windows have duplicates.
- *Structure:* either a `SortedSet<(int value, int index)>` — pairing with the
  index makes every element unique — or a `SortedDictionary<int, int>` used as a
  multiset with counts.
- *Skeleton:* maintain the window; for the median, walk to the middle. To keep it
  O(log k), use the two-heap approach with **lazy deletion**: mark removed
  elements and discard them when they surface at a heap top.
- *Overflow note:* the even-`k` median is `((long)a + b) / 2.0`, not `(a + b) / 2`.
