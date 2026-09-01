# Book 23 — Monotonic Stack / Deque

> The book of *"the nearest bigger thing on my left or right."*

## 1. What problem does this book solve?

Answering "what is the next/previous greater or smaller element" for **every**
position, in O(n) total. It works by maintaining a stack whose contents are
always sorted, discarding elements the moment they can never be an answer again.

This is the least intuitive book on the shelf and one of the highest-leverage,
because the naive version is O(n^2) and the pattern is nearly invisible until
you have seen it.

## 2. Signals

- "**Next greater** element" / "next smaller"
- "**Previous** greater / smaller"
- "Nearest larger / warmer / taller to the right"
- "How many days until a warmer temperature"
- "Largest rectangle" in a histogram
- "Trapping rain water"
- "Maximum of every sliding window" → monotonic **deque**
- "Remove k digits to make the smallest number"
- "Stock span" / "how long has this been the maximum"
- "Visible buildings" / "can see the sunset"
- "Maximum width ramp"

**The tell:** for each element you need a relationship with the **nearest**
element satisfying a comparison — and you were about to scan outward from every
index.

## 3. The naive instinct

```csharp
// Next greater element for every index
for (int i = 0; i < n; i++)
{
    res[i] = -1;
    for (int j = i + 1; j < n; j++)
        if (nums[j] > nums[i]) { res[i] = nums[j]; break; }
}
```

## 4. Why that is inferior

O(n^2), and it **re-scans regions already proven useless**. If `nums[j]` was too
small for `nums[i]`, and `nums[i+1] >= nums[i]`, then `nums[j]` is too small for
`nums[i+1]` as well — but the naive loop checks it again.

The monotonic stack keeps only the elements that are still *candidates* for
future answers. Each element is pushed exactly once and popped at most once, so
the total work is O(n) despite the nested-looking `while`.

That amortization argument — **push once, pop once** — is what to internalize.
It is the same reasoning that makes sliding windows O(n) (10).

## 5. What to recognize

**Next greater element** — decreasing stack of indices:

```csharp
var res = new int[n];
Array.Fill(res, -1);
var st = new Stack<int>();              // holds INDICES, values decreasing

for (int i = 0; i < n; i++)
{
    // current element resolves everything smaller still waiting
    while (st.Count > 0 && nums[st.Peek()] < nums[i])
        res[st.Pop()] = nums[i];        // answer found for that index
    st.Push(i);
}
// anything left has no greater element to the right
```

Read it as: *"I am the answer to everyone smaller who was waiting."*

**Choosing the direction and comparison** — the four-way table:

| You want | Iterate | Pop while stack top is |
|---|---|---|
| Next greater to the right | left → right | smaller |
| Next smaller to the right | left → right | larger |
| Previous greater to the left | left → right | smaller (answer = new top after popping) |
| Previous smaller to the left | left → right | larger (answer = new top) |

For "previous" variants, the answer is whatever remains on the stack *after* the
pops — that is the nearest surviving candidate.

**Store indices, not values.** You almost always need the distance
(`i - st.Peek()`) or the width of a span.

**Monotonic deque for sliding window maximum** — a stack is insufficient because
you must also evict from the front when elements leave the window:

```csharp
var dq = new LinkedList<int>();          // indices, values DECREASING
var res = new List<int>();

for (int i = 0; i < nums.Length; i++)
{
    // evict from the FRONT: out of the window
    if (dq.Count > 0 && dq.First.Value <= i - k) dq.RemoveFirst();

    // evict from the BACK: smaller elements can never be the max again
    while (dq.Count > 0 && nums[dq.Last.Value] <= nums[i]) dq.RemoveLast();

    dq.AddLast(i);
    if (i >= k - 1) res.Add(nums[dq.First.Value]);   // front is the window max
}
```

The front is always the maximum; the back is where new candidates enter. .NET
has no `Deque<T>`, so `LinkedList<T>` (06) or an array-based ring buffer.

## 6. Complexity

| Problem | Time | Space |
|---|---|---|
| Next greater / smaller (all positions) | **O(n)** | O(n) |
| Largest rectangle in histogram | O(n) | O(n) |
| Sliding window maximum | O(n) | O(k) |
| Trapping rain water (stack) | O(n) | O(n) |
| Naive equivalents | O(n^2) or O(n * k) | O(1) |

Each index is pushed once and popped once. The inner `while` does not multiply
the outer loop — it amortizes against it.

## 7. C# specifics

```csharp
var st = new Stack<int>();               // indices
var dq = new LinkedList<int>();          // deque substitute

// Array-based ring deque — faster when k is known
var buf = new int[n];
int head = 0, tail = 0;                  // [head, tail)
// push back: buf[tail++] = i;
// pop back:  tail--;
// pop front: head++;
// front:     buf[head]
```

For hot paths the array deque is meaningfully faster than `LinkedList<T>` — no
node allocation, contiguous memory (03, 31).

`Array.Fill(res, -1)` for the "no answer" default is cleaner than a loop.

## 8. Common mistakes

1. **Pushing values instead of indices** — then you cannot compute widths or
   distances.
2. **`<` vs `<=` in the pop condition.** With duplicates, this decides whether
   equal elements resolve each other. For "next strictly greater," pop while
   strictly smaller.
3. **Forgetting leftovers** — elements still on the stack at the end have no
   answer; initialize the result to the sentinel.
4. **Using a stack for sliding window maximum** — you need front eviction too.
5. **Wrong monotonic direction** — increasing vs decreasing. Derive it from the
   table rather than guessing.
6. **Histogram sentinel omitted** — appending a height of 0 flushes the stack
   and avoids a duplicated post-loop drain.
7. **Circular array variants** — iterate `2n` times with `i % n` for "next
   greater in a circular array."

## 9. Correct-book problems

- Next Greater Element I / II (circular) / III
- Daily Temperatures — the cleanest introduction
- Largest Rectangle in Histogram — the hard archetype
- Maximal Rectangle (histogram per row)
- Trapping Rain Water (stack version; two pointers also works, 09)
- Sliding Window Maximum — monotonic deque
- Remove K Digits; Remove Duplicate Letters — smallest result via a stack
- Sum of Subarray Minimums — contribution counting with previous/next smaller
- Online Stock Span
- Car Fleet (sort, then stack)
- Maximum Width Ramp
- 132 Pattern

## 10. Where it looks right but is wrong

- **You need the max of the whole array** — one pass, no stack.
- **You need the Kth largest** → heap (07).
- **The relationship is not "nearest"** — if any greater element will do, a
  simple scan or a sorted structure is simpler.
- **The window maximum is needed but k is tiny** — a naive rescan may be faster
  in practice despite O(n * k).
- **You need range max queries on static data** → sparse table, O(1) per query.
- **The comparison is not a total order** — monotonicity has no meaning.
- **It is really a sliding window with a sum** — sums are incremental; maxima
  are not, and that is exactly why the deque exists (10).

---

## Production Lens

This pattern is rarer in production than the others, but it appears in
time-series processing: rolling maxima over telemetry, peak detection, and
"time since last higher value" metrics. Streaming analytics libraries implement
exactly the monotonic deque for windowed max/min.

If you find yourself writing rolling-window aggregates by hand, check whether
the metrics or reactive library already has a windowed operator (33). Sum-like
aggregates are easy; max/min are the ones people get quadratically wrong.

**Related:** [[Book04-Stack]], [[Book10-SlidingWindow]],
[[Book06-LinkedList]], [[Book09-TwoPointers]].
