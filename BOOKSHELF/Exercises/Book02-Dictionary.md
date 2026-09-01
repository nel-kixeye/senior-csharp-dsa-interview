# Exercises — Book 02: Dictionary

**Reach for it when:** the answer is not a bool — counts, indices, groups, memos.
**The idiom:** `TryGetValue` (one lookup), `GetValueOrDefault(k) + 1` (counting).

---

### E02.1 — Two Sum
Given an **unsorted** integer array and a target, return the **indices** of the
two values that sum to the target. Exactly one solution exists.

- **Constraints:** up to 10⁴ elements; values may be negative; you may not use
  the same element twice.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** negatives; the two values are equal (`[3,3]`, target 6); target
  is 0.
- **Before you code:** why can't you sort this array first? Answer in one
  sentence — it is the whole reason this is a Dictionary problem.

### E02.2 — First Unique Character
Given a string, return the **index** of the first character that appears exactly
once, or `-1` if there is none.

- **Constraints:** up to 10⁵ characters, lowercase English letters.
- **Target:** O(n) time, O(1) space (bounded alphabet).
- **Edge cases:** empty string; all characters repeat; the answer is the last
  character.
- **Before you code:** a `HashSet` cannot solve this. Say exactly why in one
  sentence. Then: what beats a `Dictionary` here, given the constraint?

### E02.3 — Group Anagrams
Given an array of strings, group all anagrams together. Return a list of groups
in any order.

- **Constraints:** up to 10⁴ strings, each up to 100 lowercase letters.
- **Target:** O(n · L log L) with a sorted key, or O(n · L) with a count key.
- **Edge cases:** empty strings; single-character strings; no anagrams at all;
  all strings anagrams of each other.
- **Before you code:** what makes two words the same group? You need a
  **canonical form** — name two different ones and their costs.

### E02.4 — Top K Frequent Elements
Given an integer array and integer `k`, return the `k` most frequent elements.

- **Constraints:** up to 10⁵ elements; `k` is always valid; answer is unique.
- **Target:** better than O(n log n).
- **Edge cases:** `k` equals the number of distinct values; all elements
  identical; ties in frequency.
- **Before you code:** this needs two books. Name both and assign each a job.
- **Follow-up:** there is an O(n) solution that uses no heap at all. What bounds
  the possible frequencies, and how does that let you sort in linear time?

### E02.5 — Isomorphic Strings
Given two strings `s` and `t`, determine whether the characters of `s` can be
replaced to get `t`. Each character must map to exactly one character, and no two
characters may map to the same one. Order must be preserved.

Example: `"egg"` and `"add"` → true. `"foo"` and `"bar"` → false.

- **Constraints:** up to 5·10⁴ characters.
- **Target:** O(n) time, O(1) space (bounded alphabet).
- **Edge cases:** different lengths; `"ab"` vs `"aa"` (two chars mapping to one —
  must fail); identical strings.
- **Before you code:** one dictionary is not enough. Why? Name what the second
  one enforces.

---
---

# ⛔ STOP — hints below

Take **one rung at a time.**

---

**E02.1**
- *Nudge:* As you scan, ask "have I already seen the number that completes this
  pair?"
- *Structure:* `Dictionary<int value, int index>`, built as you go — not
  beforehand.
- *Skeleton:*
  ```
  if (seen.TryGetValue(target - nums[i], out int j)) return new[] { j, i };
  seen[nums[i]] = i;
  ```
  Checking *before* inserting is what prevents pairing an element with itself.

**E02.2**
- *Nudge:* You need counts, then positions. Two passes, not one.
- *Structure:* `int[26]` of counts (the alphabet is bounded — no hashing needed).
- *Skeleton:* pass 1 counts; pass 2 walks the **string** again (not the counts
  array) and returns the first index whose count is 1.

**E02.3**
- *Nudge:* Anagrams share something that is identical between them. Make that the
  key.
- *Structure:* `Dictionary<string, List<string>>`.
- *Skeleton:* key = `new string(word.OrderBy(c => c).ToArray())`, or a 26-length
  count array rendered as a string. The count key is O(L) versus O(L log L).

**E02.4**
- *Nudge:* Count first. Then select — do not sort everything.
- *Structure:* `Dictionary<int,int>` for counts + a **min**-heap of size `k`
  keyed on frequency.
- *Skeleton:* `pq.Enqueue(value, freq); if (pq.Count > k) pq.Dequeue();`
- *Follow-up rung:* frequencies range 1..n, so `List<int>[] buckets` indexed by
  frequency lets you walk buckets from the top — O(n), no heap.

**E02.5**
- *Nudge:* A mapping in one direction allows `"ab"` → `"aa"`. That must fail.
- *Structure:* two maps (or two `int[128]` arrays of last-seen positions).
- *Skeleton:* for each index, check `s[i]`'s existing mapping matches `t[i]`
  **and** `t[i]`'s reverse mapping matches `s[i]`; otherwise return false.
  The elegant variant: compare `lastSeenIndexOf(s[i])` and
  `lastSeenIndexOf(t[i])` — they must be equal at every position.
