# Before You Loop

The recurring drill. Run it on **every** exercise, and eventually on every
problem at work.

## The question

> **What data structure or built-in operation could eliminate unnecessary work
> before I write a loop?**

The goal is not to eliminate loops. Loops are fine, and many correct answers are
loops. The goal is to make the loop a **decision** instead of a **default**.

## The four-step protocol

Before typing `for`, answer these in order. Out loud, or in writing.

### 1. What information am I trying to maintain?

Not "what do I do to each element" — *what do I need to know* as I move through
the data.

| What I need to maintain | Structure |
|---|---|
| Which values I have seen | HashSet |
| How many times I have seen each | Dictionary |
| Something computed about each value | Dictionary |
| The order things arrived | Queue |
| The most recent unresolved thing | Stack |
| The current extreme, as data changes | PriorityQueue |
| Sorted order, as data changes | SortedSet |
| A running total over a range | Prefix Sum |
| The contents of a moving range | Sliding Window |
| Answers to subproblems I already solved | Dictionary (memo) |

### 2. Am I about to do repeated work?

Look for these specific shapes. Each one has a standard replacement:

| The shape | Replace with |
|---|---|
| A loop inside a loop over the same data | HashSet / Dictionary / Two Pointers |
| `Contains` or `IndexOf` inside a loop | HashSet |
| Recomputing a sum over a range | Prefix Sum |
| Scanning to find the min or max each pass | PriorityQueue |
| Re-sorting inside a loop | Sort once, or SortedSet |
| `string +=` inside a loop | StringBuilder |
| `list.RemoveAt(0)` or `Insert(0, x)` | Queue |
| A recursive call with arguments seen before | Memoization |
| Scanning sorted data linearly | Binary Search |
| Rescanning the tail for "the next bigger one" | Monotonic Stack |

### 3. Does the framework already do this?

Before ten lines of loop, check: `Math.*`, `Array.*`, `Enumerable.*`,
`string.*`, `char.*`, `BitOperations.*`, `MemoryExtensions` (Book 33).

If the operation has a one-word name — reverse, sort, count, clamp, fill, join,
chunk, distinct, shuffle — it probably exists.

### 4. Only now: is a loop actually the right tool?

Often yes. Write it deliberately, knowing what you rejected.

## The instinct swap, stated plainly

| Old first thought | New first thought |
|---|---|
| "Here's a list. I'll write a for loop." | "What am I trying to maintain?" |
| "I'll check every pair." | "Can a hash structure make this one pass?" |
| "I'll scan to find the smallest." | "Can a heap keep the smallest for me?" |
| "I'll recompute the sum." | "Can I precompute prefixes once?" |
| "I'll re-sort after each insert." | "Can a tree keep it sorted for me?" |
| "I'll build the string as I go." | "StringBuilder, or `string.Join`?" |
| "I'll write a helper for this." | "Does .NET already have it?" |

## The complexity tripwire

If you are writing a nested loop over the same collection, stop and say the
complexity out loud. **"This is O(n²)."**

Then ask: *is n small and bounded?* If yes, the nested loop may genuinely be the
right, clear answer — say so and move on. If n is unbounded or large, one of the
replacements above almost certainly applies.

The tripwire is not "never write O(n²)." It is "never write O(n²) **by
accident**."

## The production question

Every few drills, also ask:

> **If this were production C# rather than an interview, what would I reach
> for?**

- Does .NET already have this abstraction?
- Would LINQ state the intent more clearly?
- Is this allocation-sensitive?
- Would a `HashSet` communicate "these are unique" better than a `List`, even at
  n = 20?
- What is the comparer? What happens on concurrent access? What invalidates this
  cache?

Interview-optimal and production-optimal are frequently different answers, and
knowing *both* — and why they diverge — is the actual senior skill.

## The one-line version

> **What am I trying to maintain, and does a structure maintain it for me?**
