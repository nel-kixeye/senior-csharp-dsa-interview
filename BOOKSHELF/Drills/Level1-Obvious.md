# Level 1 — Obvious

12 drills. The correct book should surface quickly. This level builds the
*habit* of asking the question at all, before the answer gets hard.

## For every drill, answer these five before moving on

1. **Which book?**
2. **Why** — which specific words in the statement triggered it?
3. **Expected time and space complexity?**
4. **What is the naive approach, and what does it cost?**
5. **Which concrete C# type or API?**

Write your answers down. Commit to them. Then — and only then — open
[ANSWERS.md](ANSWERS.md).

A wrong answer you committed to teaches more than a right answer you glanced at.

---

### D01
Given an array of integers, determine whether any value appears more than once.

### D02
Given an array of integers, return the number of occurrences of every distinct
value.

### D03
A web server receives upload jobs. Process them in the order they were
submitted, one at a time.

### D04
Given a string containing only `(`, `)`, `[`, `]`, `{`, `}`, determine whether
the brackets are correctly balanced and properly nested.

### D05
You have a sorted array of 1,000,000 integers. Determine whether a given target
value is present. The array does not change between queries, and you will run
millions of queries.

### D06
A sensor emits 10,000,000 readings. You cannot hold them all in memory. Return
the 3 largest values seen.

### D07
Given a fixed array of integers that never changes, answer 100,000 queries of
the form "what is the sum of elements between index `i` and index `j`?"

### D08
Given an array of integers, find the maximum sum of any 5 consecutive elements.

### D09
Given a **sorted** array of integers and a target, find two values that sum to
the target. You may not use extra memory proportional to the input.

### D10
You have 50,000 customer names. Produce a single comma-separated string
containing all of them.

### D11
Given a 2D grid of `1`s (land) and `0`s (water), count the number of distinct
islands. Cells connect horizontally and vertically.

### D12
Given a `List<string>` of tags, produce a collection containing each distinct
tag exactly once. The order of the result does not matter.

---

**Before you check:** for each drill you answered with a loop, run
[BeforeYouLoop.md](BeforeYouLoop.md) over it once more. Did you pick the loop, or
did the loop pick you?
