# Exercises — Book 11: Prefix Sum

**Reach for it when:** repeated range queries, or "count subarrays with property
X".
**Two forms:** the prefix array (`n+1` long, leading zero) and the **difference
array** (range updates, read once).
**Always:** accumulate in `long`.

---

### E11.1 — Find Pivot Index
Return the leftmost index where the sum of everything to its left equals the sum
of everything to its right. Return `-1` if none exists.

- **Constraints:** up to 10⁴ elements; values may be negative.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** index 0 is the pivot (left sum is 0); the last index; all
  zeroes (index 0); no pivot; single element.
- **Before you code:** you do not need a prefix *array* for this one. What single
  running value plus the total is enough?

### E11.2 — Range Sum Query — Immutable
Design a structure built once from an array that answers `SumRange(i, j)`
(inclusive) many times.

- **Constraints:** up to 10⁴ elements, 10⁴ queries; values may be negative.
- **Target:** O(n) build, **O(1) per query**.
- **Edge cases:** `i == j`; `i == 0`; the full range; negative values summing
  past `int` range.
- **Before you code:** why build the prefix array with length `n + 1` and a
  leading zero? Say what special case that removes.

### E11.3 — Subarray Sum Equals K
Count the contiguous subarrays whose elements sum to exactly `k`. **Values may be
negative.**

- **Constraints:** up to 2·10⁴ elements; `k` may be negative.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** `k = 0`; all zeroes (many overlapping answers); negatives;
  single element equal to `k`; a subarray starting at index 0.
- **Before you code:** name the seed value your dictionary needs before the loop
  starts, and say what it accounts for. Then say why a sliding window is invalid
  here.

### E11.4 — Contiguous Array
Return the length of the longest contiguous subarray containing an **equal number
of 0s and 1s**.

- **Constraints:** binary array up to 10⁵ elements.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** no valid subarray; the entire array is valid; alternating
  values; all identical.
- **Before you code:** this does not look like a sum problem. One substitution
  makes it one. What do you replace each `0` with?

### E11.5 — Corporate Flight Bookings
Given `n` flights and bookings of the form `(first, last, seats)` meaning `seats`
were reserved on **every** flight in the inclusive range, return the total seats
reserved per flight.

- **Constraints:** up to 2·10⁴ bookings, `n` up to 2·10⁴. A nested loop is
  10⁸ operations — too slow.
- **Target:** O(bookings + n) time, O(n) space.
- **Edge cases:** `first == last`; `last == n` (watch the array bound); a single
  booking covering everything; totals exceeding `int`.
- **Before you code:** you are applying many **range updates** and reading the
  array **once** at the end. That is the mirror image of a prefix sum — name the
  technique and the two lines it needs per booking.

---
---

# ⛔ STOP — hints below

---

**E11.1**
- *Nudge:* Right sum = total − left sum − current.
- *Skeleton:*
  ```
  long total = nums.Sum(x => (long)x), left = 0;
  for (int i = 0; i < n; i++) {
      if (left == total - left - nums[i]) return i;
      left += nums[i];
  }
  return -1;
  ```

**E11.2**
- *Nudge:* Precompute cumulative sums once.
- *Skeleton:* `prefix[i+1] = prefix[i] + nums[i]`, then
  `SumRange(i, j) => prefix[j+1] - prefix[i]`.
- *Why `n+1`:* `prefix[0] = 0` means a range starting at index 0 needs no special
  case — the formula works uniformly.

**E11.3**
- *Nudge:* A subarray ending at `i` sums to `k` exactly when some earlier prefix
  equals `running - k`.
- *Structure:* `Dictionary<long, int>` mapping a prefix sum to **how many times**
  it has occurred.
- *Skeleton:*
  ```
  var seen = new Dictionary<long,int> { [0] = 1 };    // <-- the seed
  long running = 0; int count = 0;
  foreach (int x in nums) {
      running += x;
      count += seen.GetValueOrDefault(running - k);
      seen[running] = seen.GetValueOrDefault(running) + 1;
  }
  ```
  `[0] = 1` accounts for subarrays that start at index 0. A window is invalid
  because negatives break the monotonicity that shrinking relies on.

**E11.4**
- *Nudge:* Replace `0` with `-1`.
- *Structure:* `Dictionary<int runningSum, int firstIndex>` — **first index**, not
  a count, because you want the *longest*.
- *Skeleton:* seed `{ [0] = -1 }`. When a running sum repeats, the subarray
  between the two occurrences sums to zero — so equal counts. Length is
  `i - firstIndex[running]`. Only record a sum the **first** time you see it.

**E11.5**
- *Nudge:* Difference array.
- *Skeleton:*
  ```
  var diff = new long[n + 1];
  foreach (var b in bookings) { diff[b.first - 1] += b.seats; diff[b.last] -= b.seats; }
  // then one prefix-sum pass over diff[0..n-1] gives the answer
  ```
  Size it `n + 1` so `diff[last]` is always in range when `last == n`. Each
  booking is O(1) instead of O(range) — that is the 10⁸ → 4·10⁴ win.
