# Book 01 — HashSet

> The book of *"have I seen this before?"*

## 1. What problem does this book solve?

Answering **membership questions in constant time**, and answering them
*repeatedly*. A `HashSet<T>` trades memory for the ability to stop scanning.

It is the single highest-leverage swap in your toolkit, because the naive
alternative is a nested loop and the nested loop is your default.

## 2. Signals — reach for HashSet when you read

- "Have I already seen…"
- "Does it contain a duplicate?"
- "Are all values unique / distinct?"
- "Remove duplicates"
- "Which elements appear in both arrays?" (intersection)
- "Which elements are in A but not B?" (difference)
- "Mark as visited" / "do not process twice"
- "Is this word in the dictionary?" (a fixed lookup set)
- Any **`Contains` check that sits inside a loop**
- Any problem where you catch yourself writing `for i` / `for j` over the *same*
  collection to compare elements

The structural tell: **you need a yes/no answer about presence, and nothing
else.** The moment you need to know *where* it was or *how many times*, you have
walked into Book 02.

## 3. The naive instinct

```csharp
// "Does this array contain a duplicate?"
for (int i = 0; i < nums.Length; i++)
    for (int j = i + 1; j < nums.Length; j++)
        if (nums[i] == nums[j]) return true;
return false;
```

Or the subtler version, which *looks* like a single loop and is not:

```csharp
var seen = new List<int>();
foreach (var n in nums)
{
    if (seen.Contains(n)) return true;   // O(n) hidden inside an O(n) loop
    seen.Add(n);
}
```

## 4. Why the naive approach is inferior

Both are **O(n^2)**. The second is the more dangerous mistake because it reads
as linear — the quadratic cost is hidden inside `List<T>.Contains`, which is a
linear scan. Reviewers miss it. You will miss it.

At n = 100 the difference is invisible. At n = 1,000,000 the first is 10^12
comparisons and the second is a production incident.

## 5. What to recognize

`HashSet<T>` — hash-based, unordered, unique. `Add` returns `bool`, and **that
return value is the whole trick**: it tells you whether the item was new, so
one call does both the check and the insert.

```csharp
var seen = new HashSet<int>();
foreach (var n in nums)
    if (!seen.Add(n)) return true;   // Add returned false => already present
return false;
```

That is the entire pattern. Learn `!set.Add(x)` as a single idiom meaning
"already seen."

## 6. Complexity

| Operation | Average | Worst |
|---|---|---|
| `Add` | O(1) | O(n) |
| `Contains` | O(1) | O(n) |
| `Remove` | O(1) | O(n) |
| `Count` | O(1) | O(1) |
| Enumerate | O(n) | O(n) |

Space: **O(n)**, and the constant is not small — each entry carries a hash code
and a next-index alongside the value. That is the trade you are making.

Worst case O(n) requires pathological hash collisions. Rare with default
comparers on `int`/`string`; achievable by an attacker with untrusted string
keys, which is a production concern, not an interview one.

Set operations on `HashSet<T>`: `UnionWith`, `IntersectWith`, `ExceptWith` are
O(size of the argument) when the argument is a collection, not O(n * m).

## 7. C# APIs worth knowing cold

```csharp
var set = new HashSet<int>();
var set2 = new HashSet<string>(StringComparer.OrdinalIgnoreCase); // custom comparer

bool added   = set.Add(5);          // false if already present  <-- the idiom
bool present = set.Contains(5);
bool removed = set.Remove(5);       // false if it was not there
int  n       = set.Count;

set.UnionWith(other);               // A = A ∪ B
set.IntersectWith(other);           // A = A ∩ B
set.ExceptWith(other);              // A = A \ B
set.SymmetricExceptWith(other);     // A = elements in exactly one

bool sub   = set.IsSubsetOf(other);
bool super = set.IsSupersetOf(other);
bool psub  = set.IsProperSubsetOf(other);
bool over  = set.Overlaps(other);   // any common element, no allocation
bool same  = set.SetEquals(other);

set.TrimExcess();
var fromSeq = nums.ToHashSet();     // LINQ
```

Two more worth knowing:

- `set.Overlaps(other)` — "do these share anything?" without building an
  intersection. Cheaper than `IntersectWith` when you only need the boolean.
- `FrozenSet<T>` (`System.Collections.Frozen`, .NET 8+) — `ToFrozenSet()` for a
  set built once and read millions of times. Slower to construct, faster to
  probe. A production tool, not an interview one.

Capacity hint: `new HashSet<int>(capacity)` avoids repeated rehashing when you
know the size in advance.

## 8. Common mistakes

1. **Using `List<T>` as a set.** `list.Contains` is O(n). This is the mistake.
2. **Ignoring `Add`'s return value**, then calling `Contains` first — two hash
   lookups where one suffices.
3. **Custom types without `GetHashCode`/`Equals`.** A `HashSet<MyClass>` uses
   reference equality by default; two equal-looking objects both get added and
   your dedup silently does nothing. Use a `record`, or implement both members,
   or pass an `IEqualityComparer<T>`.
4. **Mutating an object after it is in the set.** If the mutated field feeds
   `GetHashCode`, the entry is now unreachable — `Contains` returns false for an
   item that is provably in the set. Only store immutable keys.
5. **Expecting order.** `HashSet<T>` has no defined iteration order. It often
   *looks* insertion-ordered for small int sets, which makes this bug ship.
6. **Reaching for a set when you needed counts.** Book 02.
7. **`IntersectWith` mutates the receiver.** If you need both operands intact,
   copy first or use LINQ `Intersect`.
8. **Set ops on a `List<T>` argument repeatedly** — `ExceptWith(list)` is fine
   once, but in a loop, convert the argument to a set first.

## 9. Problems where this is the correct book

- Contains Duplicate — any duplicate at all?
- Contains Duplicate II — duplicate within distance k (sliding set of size k)
- Single Number — appears once among pairs (though **XOR is better**, Book 25)
- Intersection of Two Arrays (distinct result)
- Happy Number — cycle detection on seen sums
- Longest Consecutive Sequence — the classic; O(n) *only* because of set lookups
- Valid Sudoku — three sets per constraint family
- Jewels and Stones — build a set of jewels, scan stones once
- Missing number in 1..n (though **sum formula is better**, Book 26)
- Word Break dictionary lookups (the set half of a DP problem)
- Graph traversal `visited` — every BFS/DFS you will ever write
- Detecting a cycle in a linked list (though **fast/slow is better**, Book 06)

## 10. Where HashSet looks right but is the wrong choice

- **"Count occurrences of each value."** A set cannot count. → Dictionary (02).
- **"First duplicate, and tell me its index."** A set has no positions. →
  Dictionary<T,int> (02).
- **"Two-sum: find the pair that sums to K."** You need the *index* of the
  complement, not just its presence. → Dictionary (02). This is the single most
  common misfire on this shelf.
- **"Return duplicates in sorted order."** Set is unordered. → SortedSet (08),
  or set + sort.
- **"Kth largest distinct value."** → PriorityQueue or sort (07, 21).
- **Tiny collections (n < ~16).** A linear scan over an array beats hashing on
  both wall clock and allocation. The asymptotics lie at small n.
- **Values already sorted.** Two Pointers (09) finds duplicates in O(1) extra
  space; the set spends O(n) memory to buy nothing.
- **"Find the majority element."** Boyer–Moore is O(1) space; a set does not
  even answer the question.
- **You need to preserve first-seen order in the output.** `HashSet` alone will
  not; combine set (dedup) + `List` (order), which is exactly what `Distinct()`
  does internally.

---

## Production Lens

Interview: `new HashSet<int>()`, done.

Production, ask three more questions:

- **What is the comparer?** String keys almost always want an explicit
  `StringComparer` — `Ordinal` for identifiers and protocol tokens,
  `OrdinalIgnoreCase` for user-facing matching. Culture-sensitive comparison is
  a bug waiting for a Turkish locale.
- **Is it built once and read forever?** `ToFrozenSet()` (.NET 8+), or at least
  size the constructor.
- **Does `HashSet` communicate intent better than `List` here?** Often the
  strongest argument for a set is not speed but *meaning*: the type declares
  "these are unique, order is not significant." That is worth the swap even at
  n = 20.
- **Untrusted keys?** Hash-flooding is real for string-keyed sets on public
  endpoints. .NET randomizes string hashing per process, which mitigates it.

**Related:** [[Book02-Dictionary]] (when presence is not enough),
[[Book08-SortedSet-SortedDictionary]] (when order matters),
[[Book27-LINQ]] (`Distinct`, `ToHashSet`), [[Book29-Collections]].
