# Bookshelf Index — Signal to Book

The flashcard page. Cover the right column and read the left.

If you can do this table cold in under three minutes, the reflex is built.

## Membership, counting, lookup

| Problem Signal | Reach For | Book |
|---|---|---|
| "Have I seen this value before?" | HashSet | 01 |
| "Are there any duplicates?" | HashSet | 01 |
| "Remove duplicates" | HashSet / `Distinct()` | 01, 27 |
| "Is X in this collection?" (repeatedly) | HashSet | 01 |
| "In both / either / only one collection?" | `IntersectWith` / `UnionWith` / `ExceptWith` | 01 |
| "Mark as visited so I do not reprocess" | HashSet | 01, 16 |
| "How many times does each value occur?" | `Dictionary<T,int>` | 02 |
| "Key to value lookup" | Dictionary | 02 |
| "Remember *something about* a value I saw" | Dictionary (not HashSet) | 02 |
| "First/last index of each value" | `Dictionary<T,int>` | 02 |
| "Group items by a property" | `Dictionary<K,List<V>>` / `GroupBy` | 02, 27 |
| "Cache a computed result" | Dictionary (memoization) | 02, 19 |
| "Anagram / same character multiset" | `Dictionary<char,int>` or sorted key | 02, 24 |

**The HashSet vs Dictionary tell:** do you need to know *that* you saw it
(HashSet), or *something about* what you saw (Dictionary)? "Was it there" versus
"where / how many / which one."

## Order of processing

| Problem Signal | Reach For | Book |
|---|---|---|
| "Process in arrival order" / FIFO | Queue | 05 |
| "Level by level" / "layer by layer" | Queue (BFS) | 05, 17 |
| "Fewest steps / minimum moves" (unweighted) | BFS | 17 |
| "Nearest / closest state" | BFS | 17 |
| "Most recently seen" / LIFO | Stack | 04 |
| "Matching brackets / nesting" | Stack | 04 |
| "Undo" / "backtrack one step" | Stack | 04 |
| "Explore as deep as possible" | DFS (recursion or Stack) | 18 |
| "Does a path exist?" | DFS | 18 |
| "Next greater / next smaller element" | Monotonic Stack | 23 |
| "Maximum of every window" | Monotonic Deque | 23 |
| "Repeatedly need the min/max" | PriorityQueue | 07 |
| "Top K / Kth largest" | PriorityQueue (size-K heap) | 07 |
| "Merge k sorted sequences" | PriorityQueue | 07 |
| "Streaming, cannot hold all the data" | PriorityQueue | 07 |

## Ordering and ranges

| Problem Signal | Reach For | Book |
|---|---|---|
| "Sorted array" + "find a pair" | Two Pointers | 09 |
| "From both ends inward" | Two Pointers | 09 |
| "Palindrome check" | Two Pointers | 09, 24 |
| "In-place partition / remove elements" | Two Pointers (read/write) | 09 |
| "Is one sequence a subsequence of another?" | Two Pointers | 09 |
| "Contiguous subarray / substring" | Sliding Window | 10 |
| "Longest / shortest range satisfying X" | Sliding Window (variable) | 10 |
| "Window of exactly size K" | Sliding Window (fixed) | 10 |
| "At most K distinct" | Sliding Window + Dictionary | 10, 02 |
| "Repeated range-sum queries" | Prefix Sum | 11 |
| "Subarray summing to K" | Prefix Sum + Dictionary | 11, 02 |
| "Count subarrays with property X" | Prefix Sum + Dictionary | 11 |
| "Sorted data + fast search" | Binary Search | 12 |
| "Can I discard half the candidates?" | Binary Search | 12 |
| "Smallest value satisfying a monotone predicate" | Binary Search on the answer | 12 |
| "Minimize the maximum" / "maximize the minimum" | Binary Search on the answer | 12 |
| "First / last occurrence" | Binary Search (lower/upper bound) | 12 |
| "Keep unique values sorted while mutating" | SortedSet | 08 |
| "Predecessor / successor query" | SortedSet (`GetViewBetween`) | 08 |
| "Iterate keys in sorted order" | SortedDictionary | 08 |
| "Would sorting make everything obvious?" | Sort first, then re-read the problem | 21 |

## Structure of the data

| Problem Signal | Reach For | Book |
|---|---|---|
| "Parent / child / hierarchy" | Tree | 15 |
| "Nested / recursive structure" | Tree + Recursion | 15, 13 |
| "Sorted tree / BST" | Inorder traversal is sorted | 15 |
| "These things are connected" | Graph | 16 |
| "Depends on / prerequisite / ordering constraint" | Topological Sort | 16 |
| "Islands / regions / clusters" | Connected components (DFS/BFS) | 16, 18 |
| "Is there a cycle?" | DFS with state colors / visited | 16, 18 |
| "Grid" | A graph in disguise (4 or 8 neighbors) | 16 |
| "Start / end / duration" | Intervals | 22 |
| "Overlapping ranges / double-booking" | Intervals (sort by start) | 22 |
| "Meeting rooms / max concurrency" | Intervals + PriorityQueue, or sweep line | 22, 07 |
| "Linked nodes, cycle detection" | Fast / slow pointers | 06 |
| "Reverse a chain of pointers" | Linked List (prev / cur / next) | 06 |

## Search, optimization, generation

| Problem Signal | Reach For | Book |
|---|---|---|
| "Generate all subsets / permutations / combinations" | Backtracking | 14 |
| "All valid arrangements under constraints" | Backtracking (choose, explore, undo) | 14 |
| "Count the ways" | DP (usually, not backtracking) | 19 |
| "Am I solving the same subproblem repeatedly?" | DP / memoization | 19 |
| "Optimal: min/max over choices with structure" | DP | 19 |
| "Overlapping subproblems + optimal substructure" | DP | 19 |
| "Take the best-looking option now" | Greedy, *then prove it* | 20 |
| "Maximum non-overlapping intervals" | Greedy by earliest end | 20, 22 |
| "Fewest coins" (arbitrary denominations) | DP, **not** greedy | 19, 20 |
| "Problem splits into independent halves" | Divide and conquer / Recursion | 13 |

## C# and .NET specific

| Problem Signal | Reach For | Book |
|---|---|---|
| "Transform every element" | `Select` | 27 |
| "Keep only matching elements" | `Where` | 27 |
| "Flatten nested collections" | `SelectMany` | 27 |
| "Group by a property" | `GroupBy` | 27 |
| "Build a lookup" | `ToDictionary` / `ToLookup` | 27 |
| "Does any / do all satisfy?" | `Any` / `All` | 27 |
| "Repeated string concatenation in a loop" | StringBuilder | 30 |
| "Parse without allocating" | `Span<char>` / `ReadOnlySpan<char>` | 31 |
| "Slice a string" | `AsSpan()` slice, not `Substring` | 31, 28 |
| "Is this a letter / digit?" | `char.IsLetter` / `IsDigit` / `IsLetterOrDigit` | 28 |
| "Case-insensitive compare" | `StringComparison.OrdinalIgnoreCase` | 28 |
| "Parse input that might be garbage" | `TryParse`, never `Parse` | 26, 32 |
| "Fixed date format from a feed" | `ParseExact` + `InvariantCulture` | 32 |
| "Date without a time component" | `DateOnly` | 32 |
| "Before I write 15 lines..." | Check `Math.*`, `Array.*`, `Enumerable.*`, `string.*` | 33 |
| "Toggle / flags / on-off state" | Bit manipulation | 25 |
| "Find the single unpaired value" | XOR | 25 |
| "Is it a power of two?" | `(n & (n - 1)) == 0` | 25 |
| "Might this overflow?" | `long`, `checked`, `Math.BigMul` | 26 |
| "Which collection do I even want?" | Book 29 comparison table | 29 |

## Complexity smells: when to stop and rethink

| You are about to write | Suspect | Usually becomes |
|---|---|---|
| Nested loop over the same array | O(n^2) | HashSet / Dictionary / Two Pointers, O(n) |
| `list.Contains(x)` inside a loop | O(n^2) | HashSet, O(n) |
| Recomputing a range sum in a loop | O(n^2) | Prefix Sum, O(n) |
| Re-sorting inside a loop | O(n^2 log n) | Sort once, or SortedSet |
| Scanning to find the min each iteration | O(n^2) | PriorityQueue, O(n log n) |
| `string += ...` in a loop | O(n^2) copying | StringBuilder, O(n) |
| Recursion recomputing the same arguments | exponential | Memoization, polynomial |
| Linear scan of sorted data | O(n) | Binary Search, O(log n) |
| `list.RemoveAt(0)` in a loop | O(n^2) | Queue, O(n) |
| `list.Insert(0, x)` in a loop | O(n^2) | Add then reverse, or LinkedList |

## The one question

Before any loop:

> **What am I trying to maintain, and does a structure maintain it for me?**
