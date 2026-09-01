# Book 09 — Two Pointers

> The book of *"the nested loop was doing redundant work."*

## 1. What problem does this book solve?

Collapsing an O(n^2) double scan into a single O(n) pass by exploiting
**monotonicity** — the fact that moving a pointer in one direction can only
change the answer in one direction, so you never need to go back.

## 2. Signals

- "**Sorted** array" plus almost any pairing question
- "Find a pair that sums to / differs by X"
- "Two / three / four numbers such that…"
- "From both ends" / "converge" / "meet in the middle"
- "Palindrome"
- "Remove / move elements **in place**" → read pointer + write pointer
- "Partition" / "segregate" / "reorder in place"
- "Is A a subsequence of B?" → two pointers over two sequences
- "Merge two sorted sequences"
- **O(1) extra space required** on an array problem — this constraint almost
  always means two pointers
- "Container with most water" / "trapping" area problems

**The tell:** the data is sorted (or can be sorted), and you were about to
compare every element against every other element.

## 3. The naive instinct

```csharp
// "Find two numbers in a sorted array that sum to target"
for (int i = 0; i < n; i++)
    for (int j = i + 1; j < n; j++)
        if (nums[i] + nums[j] == target) return new[] { i, j };
```

## 4. Why that is inferior

O(n^2), and it **ignores the sortedness entirely** — the same code would run on
unsorted input. Whenever you write a nested loop over sorted data, you are
discarding information you were given for free.

The insight: with `left` at the start and `right` at the end, if
`nums[left] + nums[right] < target`, then pairing `right` with anything smaller
than `left` is also too small. That entire column is eliminated in one step.
Each step removes a row or a column, so the scan is O(n).

## 5. What to recognize

Three distinct shapes wear the same name. Know which one you are in.

```csharp
// (a) Converging — sorted data, pair search
int lo = 0, hi = n - 1;
while (lo < hi)
{
    int sum = nums[lo] + nums[hi];
    if (sum == target) return new[] { lo, hi };
    if (sum < target) lo++;      // need larger
    else hi--;                   // need smaller
}

// (b) Read/write (fast/slow) — in-place filtering
int write = 0;
for (int read = 0; read < n; read++)
    if (Keep(nums[read]))
        nums[write++] = nums[read];
return write;                    // new logical length

// (c) Two sequences — merge / subsequence
int i = 0, j = 0;
while (i < a.Length && j < b.Length)
    if (a[i] == b[j]) { i++; j++; }
    else if (a[i] < b[j]) i++;
    else j++;
```

Shape (b) is the one people miss. "Remove all zeroes in place," "dedupe a sorted
array," "move all evens left" — all the same three lines.

## 6. Complexity

| Shape | Time | Space |
|---|---|---|
| Converging | O(n) after sorting | O(1) |
| Read/write | O(n) | O(1) |
| Two sequences | O(n + m) | O(1) |
| 3Sum (sort + n converging scans) | O(n^2) | O(1) or O(log n) for the sort |

If the input needs sorting first, the sort dominates: **O(n log n)**. That is
still far better than O(n^2), and it is why "sort, then two pointers" is a
standard combination (21).

The space story is the differentiator: two pointers is **O(1) extra space**
where a HashSet solution is O(n).

## 7. C# specifics

There is no library API here — this is a technique, not a type. What matters:

```csharp
Array.Sort(nums);                        // enables the technique
Array.Sort(keys, items);                 // sort parallel arrays together
Array.Sort(people, (a, b) => a.Age.CompareTo(b.Age));

// Operate on a slice without copying (31)
static bool IsPal(ReadOnlySpan<char> s)
{
    for (int i = 0, j = s.Length - 1; i < j; i++, j--)
        if (s[i] != s[j]) return false;
    return true;
}

// In-place result length convention
int len = RemoveDuplicates(nums);
// caller uses nums[0..len]
```

Watch out: sorting **destroys original indices**. If the answer must report
original positions (as Two Sum does), either use a Dictionary instead (02), or
sort `(value, originalIndex)` pairs.

## 8. Common mistakes

1. **Forgetting to sort** when the technique requires it.
2. **Sorting when the answer needs original indices** — silently wrong.
3. **`while (lo <= hi)` vs `< hi`.** For pair-finding you want `<` (an element
   cannot pair with itself). For palindromes either works.
4. **Not skipping duplicates in 3Sum**, producing repeated triplets. The fix:
   `while (lo < hi && nums[lo] == nums[lo-1]) lo++;` after recording a hit.
5. **Advancing both pointers when only one should move.**
6. **Infinite loop** from a branch that advances nothing.
7. **Returning the array instead of the length** in in-place problems.
8. **Applying it to unsorted data** where monotonicity does not hold — the
   pointer movement rule becomes unjustified and the answer is wrong.

## 9. Correct-book problems

- Two Sum II (input **sorted**) — the archetype
- 3Sum; 3Sum Closest; 4Sum — sort, then fix one and two-point the rest
- Container With Most Water — move the shorter wall inward
- Trapping Rain Water (two-pointer O(1) space version)
- Valid Palindrome; Valid Palindrome II (allow one deletion)
- Remove Duplicates from Sorted Array; Remove Element; Move Zeroes
- Sort Colors (Dutch national flag — three pointers)
- Merge Sorted Array (fill from the back to avoid overwriting)
- Is Subsequence
- Squares of a Sorted Array (largest magnitude at the ends)
- Reverse String / Reverse Vowels
- Backspace String Compare (scan from the right)
- Linked-list fast/slow variants (06)

## 10. Where Two Pointers looks right but is wrong

- **Unsorted data and you cannot sort** (indices needed, or O(n) required) →
  Dictionary (02). Classic Two Sum is a Dictionary problem, not a two-pointer
  problem, precisely because it returns indices on unsorted input.
- **Contiguous-range questions with a condition** → Sliding Window (10). Related
  technique, different bookkeeping: sliding window maintains state about the
  window's contents; two pointers usually does not.
- **You need counts or frequencies** → Dictionary.
- **Non-monotonic condition** — if moving a pointer does not predictably move
  the objective, the elimination argument collapses.
- **The pairing crosses more than two sequences** in a non-mergeable way.
- **Sorting costs more than the alternative** — if a HashSet gives O(n) and
  sorting costs O(n log n), and space is free, take the set.

---

## Production Lens

Two pointers is the technique that most often survives contact with production,
because "O(1) extra space, single pass" is exactly what you want when processing
large buffers, streams, or `Span<T>` slices.

Where interview and production diverge: in production, prefer
`ReadOnlySpan<T>`-based helpers and check whether `MemoryExtensions` already has
it — `Trim`, `IndexOfAny`, `SequenceEqual`, `CommonPrefixLength` are all
hand-written two-pointer loops you do not need to write (31, 33).

**Related:** [[Book10-SlidingWindow]], [[Book21-Sorting]],
[[Book12-BinarySearch]], [[Book06-LinkedList]], [[Book31-Span-Memory]].
