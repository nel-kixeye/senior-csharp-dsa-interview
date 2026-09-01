# Exercises — Practicing the Books

165 exercises. Five per book, ordered easy → hard within each file.

## How this differs from `Drills/`

| | Drills | Exercises |
|---|---|---|
| Question | "**Which** book?" | "**Use** this book." |
| The book is | hidden — that is the test | given — it is in the filename |
| Trains | recognition | execution |
| Output | a spoken answer | working C# |
| Mixed? | yes, deliberately | no, grouped by book |

You need both. Recognition without fluency means you name the right pattern and
then fumble the implementation under pressure. Fluency without recognition means
you write a beautiful sliding window for a problem that needed a heap.

**Run them together:** do a book's five exercises, then go do a Drills level. The
drills are where you find out whether the pattern actually stuck.

## The practice protocol

For every exercise, in this order:

1. **Read the statement and the constraints.** The constraints are not decoration
   — "O(1) space", "does not fit in memory", "unsorted" are usually what picks
   the approach.
2. **Answer the "Before you code" prompt.** Out loud. Every exercise has one, and
   it is always some version of *what am I maintaining, and what would the naive
   version waste?*
3. **State the target complexity before writing anything.** If your plan does not
   hit the stated target, you have the wrong plan — rethink before typing, not
   after.
4. **Write it.** In `DSA/`, in a scratch file, in LINQPad, wherever.
5. **Walk the edge cases listed.** They are chosen to break the naive version.
6. **Only if stuck: hints.** Every file has a progressive hint ladder at the
   bottom, behind a divider. Take **one rung at a time.**

## About the hints

Each exercise has up to three rungs:

- **Nudge** — one sentence, points at the insight.
- **Structure** — names the data structure and what goes in it.
- **Skeleton** — the shape of the loop, with the key line.

There are **no full solutions here**, by design. The skeleton gets you unstuck
without doing the part that builds the muscle. If you have taken all three rungs
and it still is not working, that is a genuinely useful signal — go back and read
that book's Section 5.

Follow your own three-attempt rule: try, fail, try again, fail, try again — then
take a rung.

## Where to write the code

Many exercises correspond to a question already stubbed in `DSA/`. Where they do,
the exercise says so — use that stub and its `Tests.cs`. The rest are new; a
scratch console project is fine.

## Suggested order

Do **not** go Book01 → Book33 in sequence. Follow the dependency order — the
later books assume the earlier ones:

**Foundation (do these first):** 01 HashSet, 02 Dictionary, 03 Array/List
**Order of processing:** 04 Stack, 05 Queue, 07 PriorityQueue
**Array techniques:** 09 Two Pointers, 10 Sliding Window, 11 Prefix Sum, 12 Binary Search
**Recursive structures:** 13 Recursion, 15 Trees, 16 Graphs, 17 BFS, 18 DFS
**Search and optimize:** 14 Backtracking, 19 DP, 20 Greedy
**Refinements:** 06 LinkedList, 08 SortedSet, 21 Sorting, 22 Intervals, 23 Monotonic Stack
**Domain:** 24 Strings, 25 Bits, 26 Math
**C# craft (Books 27–33):** different in character — these are rewrite, code-review,
and design-choice exercises rather than algorithm puzzles. They train the
*production* half of the instinct. Do a few between algorithm books rather than
saving them all for the end.

## Tracking

`PROGRESS.md` has a checklist of all 165. Tick them off. Re-run a book a week
later — the ones that still feel slow are the ones that have not become instinct
yet.

## The point, restated

You are not memorizing 165 solutions. You are building the reflex where a problem
statement makes a **book** surface before a `for` loop does.

If you finish an exercise and cannot say *which signal in the statement should
have told you*, the rep did not count. Go back and name it.
