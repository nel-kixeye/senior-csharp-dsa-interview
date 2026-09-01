# Exercises — Book 10: Sliding Window

**Reach for it when:** contiguous subarray/substring + a condition on contents.
**The skeleton:** expand right → restore validity → record.
**Longest** records *outside* the shrink loop; **shortest** records *inside* it.

---

### E10.1 — Maximum Average Subarray I
Find the contiguous subarray of exactly length `k` with the maximum average, and
return that average.

- **Constraints:** up to 10⁵ elements; `k <= n`; values may be negative.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** `k = n`; `k = 1`; all negative values; precision (return a
  `double`, and divide once at the end).
- **Before you code:** a fixed window means one element enters and one leaves per
  step. Write those two lines before anything else.

### E10.2 — Longest Substring Without Repeating Characters
Return the length of the longest substring containing no repeated character.

- **Constraints:** up to 5·10⁴ characters; any ASCII.
- **Target:** O(n) time, O(min(n, σ)) space.
- **Edge cases:** empty string; all identical characters; all distinct; the answer
  is the whole string.
- **Before you code:** when you hit a repeat, where does `left` jump to? There is
  a one-step version and an incremental version — name both.
- *(Stub exists: `DSA/12-SlidingWindow`.)*

### E10.3 — Longest Repeating Character Replacement
You may change at most `k` characters. Return the length of the longest substring
of a single repeated character achievable.

- **Constraints:** uppercase English letters; up to 10⁵ characters.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** `k = 0`; `k >= n`; all identical already; two characters
  alternating.
- **Before you code:** a window is valid when `windowLength - countOfMostFrequent
  <= k`. Say what that expression means in words before using it.

### E10.4 — Permutation in String
Given `s1` and `s2`, return whether `s2` contains a permutation of `s1` as a
contiguous substring.

- **Constraints:** lowercase letters; up to 10⁴ characters.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** `s1` longer than `s2` (false); `s1` equals `s2`; repeated
  characters in `s1`; single character.
- **Before you code:** the window is a **fixed** size — which one? And how do you
  compare two frequency profiles without rescanning 26 slots every step?

### E10.5 — Minimum Window Substring
Find the **shortest** substring of `s` containing every character of `t`,
including duplicates. Return `""` if none exists.

- **Constraints:** up to 10⁵ characters; `t` may contain repeats; case-sensitive.
- **Target:** O(n + m) time.
- **Edge cases:** `t` longer than `s`; no valid window; `t` has duplicate
  characters (`"AABC"` needs two A's); the answer is all of `s`.
- **Before you code:** this is a **shortest** problem. Where does the "record the
  best" line go, relative to the shrink loop? Getting that wrong is the classic
  bug — say it out loud first.

---
---

# ⛔ STOP — hints below

---

**E10.1**
- *Nudge:* Add the entering element, subtract the leaving one.
- *Skeleton:*
  ```
  sum += nums[r];
  if (r >= k) sum -= nums[r - k];
  if (r >= k - 1) best = Math.Max(best, sum);
  ```
  Track the **sum** and divide by `k` once at the end — dividing per window loses
  precision and time.

**E10.2**
- *Nudge:* Remember where each character was last seen.
- *Structure:* `Dictionary<char,int>` of last index, or `int[128]`.
- *Skeleton:* on seeing `c`, if its last index is `>= left`, jump
  `left = lastIndex[c] + 1` (one step, no loop). Then record
  `best = Math.Max(best, r - left + 1)`.
- *Incremental variant:* a `HashSet` plus `while (set.Contains(c)) set.Remove(s[left++]);`
  — same complexity, easier to derive under pressure.

**E10.3**
- *Nudge:* `windowLength - maxCount` is the number of characters you would have
  to change.
- *Structure:* `int[26]` counts, plus a running `maxCount`.
- *Skeleton:* expand right, increment the count, update `maxCount`. While
  `(r - left + 1) - maxCount > k`, shrink from the left and decrement. Record
  outside the shrink loop.
- *Subtlety worth noticing:* you never need to *decrease* `maxCount` — a stale
  high value can only make the window fail to shrink, and the answer is still
  correct because the best window found is never smaller than the true one.

**E10.4**
- *Nudge:* Fixed window of length `s1.Length`.
- *Structure:* two `int[26]` arrays — one for `s1`, one for the current window.
- *Skeleton:* slide a window of exactly `s1.Length`, adding the entering char and
  removing the leaving one. Compare with `need.AsSpan().SequenceEqual(window)`,
  or maintain a `matches` counter of how many of the 26 slots currently agree,
  updating it by ±1 as counts change — that makes each step O(1) instead of O(26).

**E10.5**
- *Nudge:* Grow until valid, then shrink while *still* valid, recording as you
  shrink.
- *Structure:* `int[128]` (or Dictionary) of required counts, a `have`/`need`
  counter.
- *Skeleton:*
  ```
  add s[right]; if (count[c] == required[c]) have++;
  while (have == need) {
      record if this window is shorter;      // <-- INSIDE the loop
      remove s[left]; if (count[c] < required[c]) have--;
      left++;
  }
  ```
  Increment `have` only when a count **reaches** its requirement — not on every
  occurrence. That is what handles duplicates in `t` correctly.
