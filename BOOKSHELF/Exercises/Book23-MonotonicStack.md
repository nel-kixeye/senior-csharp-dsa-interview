# Exercises — Book 23: Monotonic Stack / Deque

**Reach for it when:** "next/previous greater or smaller", nearest-something,
window maximum.
**Store indices, not values** — you almost always need a distance or a width.
**The cost argument:** each index is pushed once and popped once, so the
nested-looking code is O(n).

---

### E23.1 — Next Greater Element I
Given `nums1` (a subset of `nums2`), for each element of `nums1` find the first
element to its right **in `nums2`** that is greater. Return `-1` where none
exists.

- **Constraints:** up to 1000 elements; all values distinct.
- **Target:** O(n + m) time.
- **Edge cases:** the last element of `nums2` (always −1); a strictly decreasing
  `nums2` (all −1); a strictly increasing `nums2`.
- **Before you code:** you need to look answers up by **value**, not position. That
  is a second book — name it.

### E23.2 — Daily Temperatures
For each day, return how many days you must wait for a warmer temperature, or 0 if
none.

- **Constraints:** up to 10⁵ days; temperatures 30–100.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** strictly decreasing (all zeroes); strictly increasing (all
  ones); all equal (all zeroes — note "warmer" is strict); single day.
- **Before you code:** why must the stack hold **indices** rather than
  temperatures? Answer in one sentence.

### E23.3 — Sliding Window Maximum
Return the maximum of every window of size `k` as it slides across the array.

- **Constraints:** up to 10⁵ elements. **O(n) required** — O(n·k) will time out.
- **Target:** O(n) time, O(k) space.
- **Edge cases:** `k = 1` (the array itself); `k = n` (one value); strictly
  decreasing input; duplicates within a window; negative values.
- **Before you code:** a plain stack cannot do this. Say exactly which operation it
  is missing. Then: .NET has no `Deque<T>` — name two substitutes.

### E23.4 — Largest Rectangle in Histogram
Given bar heights of width 1, find the area of the largest rectangle that fits
inside the histogram.

- **Constraints:** up to 10⁵ bars; heights 0–10⁴.
- **Target:** O(n) time.
- **Edge cases:** all equal heights; strictly increasing (the whole flush must be
  handled after the loop); a single bar; a zero-height bar splitting the
  histogram.
- **Before you code:** for each bar, the rectangle it defines extends until a
  **strictly shorter** bar on each side. So you need two things per bar — name
  them, and say what a sentinel appended to the input saves you from writing.

### E23.5 — Remove K Digits
Given a numeric string, remove exactly `k` digits to produce the smallest possible
number. The result must have no leading zeroes (and `""` becomes `"0"`).

- **Constraints:** up to 10⁵ digits.
- **Target:** O(n) time.
- **Edge cases:** `k` equals the length (→ `"0"`); leading zeroes after removal
  (`"10200", k=1` → `"200"`); already ascending digits (remove from the **end**);
  `k = 0`.
- **Before you code:** to make a number smaller, which digit do you want to remove
  first when scanning left to right? State the rule, then say what happens if you
  finish the scan with removals left over.

---
---

# ⛔ STOP — hints below

---

**E23.1**
- *Structure:* monotonic stack over `nums2` + a `Dictionary<int value, int nextGreater>`.
- *Skeleton:* run the standard next-greater scan on `nums2`, recording results into
  the dictionary. Then map `nums1` through it, defaulting to −1.
  ```
  while (st.Count > 0 && st.Peek() < nums2[i]) map[st.Pop()] = nums2[i];
  st.Push(nums2[i]);
  ```
  Values are distinct here, so storing values (not indices) is safe — one of the
  few times it is.

**E23.2**
- *Skeleton:*
  ```
  var st = new Stack<int>();                    // indices, temperatures decreasing
  for (int i = 0; i < n; i++) {
      while (st.Count > 0 && temps[st.Peek()] < temps[i])
          res[st.Pop()] = i - st.Peek_beforePop;   // careful: capture the popped index
      st.Push(i);
  }
  ```
  Written properly: `int j = st.Pop(); res[j] = i - j;`
- *Why indices:* the answer is a **distance**, and a value cannot tell you where it
  came from.

**E23.3**
- *Missing operation:* eviction from the **front** — elements leaving the window.
  A stack only removes from one end.
- *Structure:* a deque of indices with **decreasing** values. Substitutes:
  `LinkedList<int>`, or an array-based ring buffer with `head`/`tail` indices
  (faster — no node allocation).
- *Skeleton:*
  ```
  if (dq.Count > 0 && dq.First.Value <= i - k) dq.RemoveFirst();     // out of window
  while (dq.Count > 0 && nums[dq.Last.Value] <= nums[i]) dq.RemoveLast();  // can never win again
  dq.AddLast(i);
  if (i >= k - 1) result.Add(nums[dq.First.Value]);                  // front is the max
  ```

**E23.4**
- *Per bar you need:* the index of the first shorter bar to its **left** and to its
  **right**. Width is then `right - left - 1`.
- *Skeleton:* increasing monotonic stack of indices. When `heights[i]` is shorter
  than the stack top, pop and compute that bar's rectangle: height is the popped
  bar, the right boundary is `i`, and the left boundary is the new stack top after
  popping (or −1 if empty).
- *The sentinel:* append a virtual bar of height 0 at the end (or loop `i` to `n`
  inclusive treating `heights[n] = 0`). It flushes everything left on the stack, so
  you do not need a separate drain loop after the main one.

**E23.5**
- *Rule:* while the previous kept digit is **greater** than the current one and you
  still have removals left, drop the previous one. Removing a larger digit that sits
  to the left of a smaller one always reduces the number more than any later removal.
- *Skeleton:*
  ```
  foreach (char c in num) {
      while (k > 0 && sb.Length > 0 && sb[^1] > c) { sb.Length--; k--; }
      sb.Append(c);
  }
  sb.Length -= k;                                    // leftover removals: trim the tail
  var s = sb.ToString().TrimStart('0');
  return s.Length == 0 ? "0" : s;
  ```
  Leftover `k` means the digits were non-decreasing, so the largest are at the end
  — trim from there.
