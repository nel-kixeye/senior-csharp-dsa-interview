# Book 10 — Sliding Window

> The book of *"contiguous, and I keep recomputing the same thing."*

## 1. What problem does this book solve?

Answering a question about **every contiguous range** without re-examining each
range from scratch. The window carries incremental state: when it moves, you
*add one* and *remove one* instead of rescanning.

## 2. Signals

The single most reliable keyword pair on the whole shelf:

- "**Contiguous** subarray" / "**substring**"
- "Longest / shortest / maximum / minimum ... subarray or substring such that"
- "Window of size K" → fixed window
- "At most K distinct / at most K replacements" → variable window
- "Exactly K" → usually `atMost(K) - atMost(K-1)` — a genuinely useful trick
- "Without repeating characters"
- "Consecutive" / "in a row"
- "Average / sum / max of every K consecutive elements"
- "Anagram / permutation **in** a string" → fixed window of counts

**Critical qualifier: contiguous.** If elements may be skipped, it is *not* a
sliding window — it is DP or greedy. This one word separates a five-minute
problem from an hour-long one.

## 3. The naive instinct

```csharp
// "Maximum sum of any K consecutive elements"
int best = int.MinValue;
for (int i = 0; i + k <= n; i++)
{
    int sum = 0;
    for (int j = i; j < i + k; j++) sum += nums[j];   // recompute every window
    best = Math.Max(best, sum);
}
```

## 4. Why that is inferior

O(n * k). Adjacent windows share k-1 elements; the inner loop re-adds all of
them. Sliding fixes it: `sum += nums[right] - nums[left]` — one add, one
subtract, O(1) per step, **O(n)** overall.

For variable windows the argument is subtler but stronger: `left` and `right`
each advance at most n times across the *entire* run, so the doubly-nested-
looking code is still O(n). The inner `while` does not multiply the outer loop —
it amortizes against it. Recognizing that is what lets you write the pattern
confidently.

## 5. What to recognize

**Fixed window** — size known:

```csharp
int sum = 0, best = int.MinValue;
for (int r = 0; r < n; r++)
{
    sum += nums[r];
    if (r >= k) sum -= nums[r - k];      // evict the element leaving the window
    if (r >= k - 1) best = Math.Max(best, sum);
}
```

**Variable window** — grow right, shrink left while invalid:

```csharp
var count = new Dictionary<char, int>();
int left = 0, best = 0;
for (int right = 0; right < s.Length; right++)
{
    count[s[right]] = count.GetValueOrDefault(s[right]) + 1;   // include right

    while (/* window is invalid */ count.Count > k)            // shrink
    {
        count[s[left]]--;
        if (count[s[left]] == 0) count.Remove(s[left]);
        left++;
    }

    best = Math.Max(best, right - left + 1);                   // window is valid
}
```

That skeleton — **expand, restore validity, record** — solves a large fraction
of all string problems. The only thing that changes between problems is the
invalid-condition and the state you maintain.

For "shortest valid window" instead of "longest," move the `best` update
**inside** the `while`, because there the window becomes valid as you shrink.

## 6. Complexity

| Variant | Time | Space |
|---|---|---|
| Fixed window, running sum | O(n) | O(1) |
| Variable window + Dictionary | O(n) | O(k) distinct |
| Fixed window + char counts | O(n) | O(1) — `int[26]` |
| Window maximum (monotonic deque) | O(n) | O(k) — see 23 |

Each pointer advances at most n times, so it is O(n) even with the inner while.

## 7. C# specifics

```csharp
// Character-count windows: prefer a fixed array over a Dictionary
Span<int> counts = stackalloc int[26];
counts[c - 'a']++;

// Comparing two count windows for anagram problems
static bool Same(ReadOnlySpan<int> a, ReadOnlySpan<int> b) => a.SequenceEqual(b);

// Maintaining "how many distinct" without recounting
if (++count[c] == 1) distinct++;
if (--count[c] == 0) distinct--;
```

That last idiom — updating a *derived* counter as you add and remove — is what
keeps the window O(1) per step. Recomputing `count.Count(kv => kv.Value > 0)`
inside the loop silently reintroduces O(n) per step.

`stackalloc int[26]` for a fixed alphabet is the senior touch: zero allocation,
better locality than a Dictionary (31).

## 8. Common mistakes

1. **Applying it to non-contiguous problems.** The word "subsequence" (not
   "subarray"/"substring") means it is not a window.
2. **Negative numbers.** The classic "smallest subarray with sum >= target"
   window requires **non-negative** values — shrinking must monotonically reduce
   the sum. With negatives, use prefix sums + a hash map (11).
3. **Recording the best answer in the wrong place** — outside the while for
   longest, inside for shortest.
4. **Forgetting to remove zero-count keys** from the Dictionary, so
   `count.Count` overstates the number of distinct characters.
5. **Shrinking with `if` instead of `while`** — one eviction may not restore
   validity.
6. **Off-by-one in the window length**: it is `right - left + 1`.
7. **Recomputing window state from scratch** inside the loop, defeating the
   entire purpose.
8. **Fixed-window eviction guard**: `if (r >= k)` must use the pre-increment
   index correctly, or the first window is wrong.

## 9. Correct-book problems

- Longest Substring Without Repeating Characters — the archetype
- Minimum Window Substring — the hard archetype; shortest-valid variant
- Longest Repeating Character Replacement — "at most k replacements"
- Permutation in String; Find All Anagrams in a String — fixed count window
- Maximum Average Subarray I; Max Consecutive Ones III
- Minimum Size Subarray Sum (non-negative values only)
- Fruit Into Baskets — "at most 2 distinct" in disguise
- Subarrays with K Different Integers — `atMost(k) - atMost(k-1)`
- Sliding Window Maximum — needs a monotonic deque (23)
- Longest Nice / Balanced substring variants

## 10. Where Sliding Window looks right but is wrong

- **Non-contiguous selection** ("subsequence", "any k elements") → DP, greedy,
  or sorting.
- **Negative numbers with a sum threshold** → prefix sums + Dictionary (11).
  This is the trap that catches experienced people.
- **"Count subarrays summing to exactly K" with negatives** → prefix sum +
  Dictionary (11), definitively not a window.
- **You need the window's maximum** → the window itself is fine, but maintaining
  the max needs a monotonic deque (23); a naive rescan makes it O(n * k).
- **Fixed K where you need the median** → two heaps or a multiset (07, 08).
- **The condition is not monotone** — if growing the window can make an invalid
  window valid again, shrinking logic is unsound.

---

## Production Lens

Real sliding windows show up in rate limiting, moving averages, telemetry
aggregation, and streaming anomaly detection. The production concerns are
different from the interview ones: time-based rather than count-based windows,
out-of-order arrivals, and memory bounds on the state you keep.

If the window is over time rather than array indices, look at existing
primitives (`System.Threading.RateLimiting`, reactive operators, or the metrics
library's built-in windowing) before hand-rolling (33).

**Related:** [[Book09-TwoPointers]], [[Book02-Dictionary]],
[[Book11-PrefixSum]], [[Book23-MonotonicStack]], [[Book24-Strings]].
