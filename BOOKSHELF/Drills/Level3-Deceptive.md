# Level 3 — Deceptive

12 drills. Each one has an obvious nested-loop solution that is correct and too
slow. The better pattern exists but does not announce itself.

This is the level that actually rebuilds the instinct. Expect to get several
wrong. That is the point.

## Answer these six before checking

1. **What is your first instinct?** Write it down honestly, even if it is a
   nested loop.
2. **What does that instinct cost?** State the complexity out loud.
3. **What information is the naive version recomputing?** This question is the
   lever — the better pattern is almost always "stop recomputing that."
4. **Which book?**
5. **Complexity of the better approach?**
6. **Which concrete C# type or API?**

---

### D25
Given an array of daily temperatures, return an array where entry `i` is the
number of days you must wait after day `i` for a warmer temperature. If no
warmer day exists, use 0.

### D26
Given an array of integers **which may be negative**, count the number of
contiguous subarrays whose elements sum to exactly `k`.

*(A window suggests itself. Read the constraint again.)*

### D27
Packages with given weights must be shipped in order, within `D` days. A ship
with capacity `C` loads packages in order without exceeding `C` per day. Find the
**minimum capacity** that completes the shipment within `D` days. Capacity may be
up to 10^9.

### D28
Given an **unsorted** array of integers, find the length of the longest sequence
of consecutive integers present in the array. Required: **O(n)**.

*(Sorting is O(n log n). The constraint forbids it.)*

### D29
Given an array and a window size `k`, return the maximum value within every
window of size `k` as the window slides from left to right.

*(A sliding window is clearly involved. What maintains the maximum?)*

### D30
Given coin denominations and a target amount, return the **fewest coins** that
sum to the amount. Denominations are arbitrary — for example `{1, 3, 4}`.

*(State your instinct. Then test it on amount = 6 with those denominations.)*

### D31
Given a collection of intervals, find the **maximum number** that can be selected
such that no two overlap.

*(You will want to sort. By what?)*

### D32
Given strings `s` and `t`, find the **shortest substring** of `s` that contains
every character of `t`, including duplicates.

### D33
Given an array where each element is the height of a bar of width 1, compute how
much rainwater is trapped between the bars.

### D34
Given an array `nums`, return an array where `output[i]` is the product of every
element **except** `nums[i]`. You may not use division, and it must run in O(n).

### D35
Given the head of a singly linked list, determine whether it contains a cycle.
Use **O(1) extra space**.

### D36
Given a string, find its longest palindromic substring.

---

**The lever question.** For every drill you got wrong, go back to question 3:
*what was the naive version recomputing?* Nearly every entry on this page is an
instance of "the nested loop re-examines data a previous iteration already
proved irrelevant." Name the wasted work and the right structure usually names
itself.
