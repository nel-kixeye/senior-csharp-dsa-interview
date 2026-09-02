# My Priorities — One-Week Interview Prep

Written 2026-09-02. Personal study plan, not part of the curriculum proper.

**The constraint that shaped this:** one week, and the goal is interview
recall — not covering all 33 books. Breadth over depth, deliberately.

---

## Where I already am

| Book | Status |
|---|---|
| 01 HashSet | **Solid.** E01.1–E01.3 done. The `!seen.Add(x)` idiom is automatic. |
| 02 Dictionary | **Solid** going in — the single most common answer in DSA interviews. |
| 03 Array / List | **Well versed.** Caveat: `List`/LINQ is sometimes forbidden (see below). |

That is already the most frequently correct answer on the whole shelf. What
follows is what to add, in order.

---

## The order to do them in

### 1. Two Pointers (Book 09) — do this first

The highest-yield thing I don't have.

**Why:** it is the answer whenever data is sorted, or whenever the constraint
says **O(1) extra space**. It is the direct escape from nested loops, the same
way HashSet was.

**Pairs with what I know:** Two Sum on *unsorted* input is Dictionary. On
*sorted* input it is two pointers. Knowing which one the word "sorted" selects
is a real discriminator.

**Canonical:** Valid Palindrome → Two Sum II → **3Sum** (the one actually asked).

### 2. Sliding Window (Book 10)

**Why:** owns every "longest/shortest **contiguous** subarray/substring such
that…" question, and those are everywhere. Uses Dictionary for the window
state, so it builds straight on Book 02.

**Canonical:** **Longest Substring Without Repeating Characters** — top-5
most-asked problem in existence.

### 3. Trees + DFS/BFS (Books 15, 18, 17)

**Why:** not one book, a *cluster* — and skipping it is not an option.
Something tree-shaped shows up in most interview loops.

Needs surprisingly little: the four traversals, the level-order queue idiom,
and "postorder when a node's answer depends on its children."

**Canonical:** Level Order → Validate BST → **Diameter** (tests postorder).

### 4. Binary Search (Book 12)

**Why:** cheap — one template — with disproportionate payoff, because of
**binary search on the answer**. "Minimize the maximum", "smallest capacity
that works" is a whole family most candidates do not recognize.

**Canonical:** Search Insert Position → First/Last Position → **Koko Eating
Bananas**.

### 5. Graphs (Book 16)

**Why:** mostly BFS/DFS already learned in #3. The new skill is *seeing* the
graph — **a grid is a graph**, and so is a set of states.

**Canonical:** **Number of Islands** → Course Schedule.

### 6. Heap (Book 07) and Stack (Book 04)

**Why:** narrower, but each owns a question type outright.
Heap = "top K" / "kth largest". Stack = brackets, and **next greater element**.

**Canonical:** Top K Frequent (Dictionary + heap — combines with Book 02) ·
Valid Parentheses · Daily Temperatures.

### 7. DP (Book 19) — last, basics only

**Why:** highest effort per point. Do Climbing Stairs, House Robber, Coin
Change and **stop**. Recognizing *"I am solving the same subproblem
repeatedly"* and being able to add a memo covers most of what is asked at
senior level.

---

## If I only get through three

**Two Pointers, Sliding Window, Trees.**

That plus the hash structures covers the majority of what gets asked, and the
three compose with each other.

---

## The "lists are sometimes forbidden" adjustment

When an interviewer bans `List` / LINQ, they are testing whether I can work
**in place, on a raw array, with fixed memory**. That shifts the ranking:

- **Two Pointers becomes MORE important, not less.** It is *the* in-place
  technique — Move Zeroes, Sort Colors, reverse-in-place all live there.
- **`int[26]` counting is a must-have.** When Dictionary is discouraged and the
  alphabet is bounded, `int[26]` indexed by `c - 'a'` is the expected answer.
  Faster, zero allocation, and it signals I understand the constraint. It
  appears constantly in Book 24.
- **LINQ drops for the DSA portion.** Still learn Book 27 — but for the *C#
  portion* of the interview, not the algorithm portion.

**The reflex to build:** *can I do this with indices and a fixed-size array?*

---

## Explicitly skipping (this week)

06 LinkedList · 08 SortedSet · 23 Monotonic Stack · 25 Bits · 26 Math ·
20 Greedy · 21 Sorting · 22 Intervals

Real, but lower-yield for one week. Come back after.

**One exception:** Books **27 (LINQ)** and **29 (Collections)** are not DSA —
they are what a *C# interviewer* asks, and that is already a strength. An hour
skimming each is cheap insurance.

---

## The routine

Per book:

```
skim Section 2 (the signals) — 10 minutes
   ↓
3 exercises: E.1, E.2, then the one the file calls "the archetype"
   ↓
next book
```

Skip the middle exercise. That gets the pattern plus the canonical problem, and
loses only the exotic variant.

**Every session, start with ten minutes on `INDEX.md`.** Under time pressure
recognition beats fluency — I can usually reason my way to an implementation if
I know *what I am reaching for*. The reverse is not true. It is the cheapest
thing on the shelf.

**Drills are a checkpoint, not a starting point.** They are mixed across all 33
books, so they only work once several books are in play. Run a level after every
few books, and re-run them — they are the measurement.

---

## The one question, when stuck

> **What am I trying to maintain, and does a structure maintain it for me?**

**Related:** [[README]] · [[INDEX]] · [[Exercises/README]]
