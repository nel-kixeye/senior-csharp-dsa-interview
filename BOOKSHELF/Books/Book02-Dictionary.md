# Book 02 — Dictionary

> The book of *"remember something about what I saw."*

## 1. What problem does this book solve?

Associating a **key with information**, retrievable in O(1). Where HashSet
remembers *that* you saw something, Dictionary remembers *what you learned* when
you saw it: a count, an index, a computed result, a bucket of related items.

This is the most frequently correct book on the entire shelf.

## 2. Signals — reach for Dictionary when you read

- "How many times does each…" → `Dictionary<T,int>`
- "Frequency" / "count of each" / "most common"
- "Map X to Y" / "look up by id"
- "Group by" → `Dictionary<K,List<V>>`
- "First index where…" / "last position of…" → `Dictionary<T,int>`
- "Have I computed this already?" (memoization) → `Dictionary<state, result>`
- "Find the pair that sums to target" → complement to index
- "Anagram" / "same letters" → char counts
- "Cache" / "lookup table" / "index"
- Anything where you thought *HashSet* and then needed one more fact

The tell: **the answer to your question is not `bool`.**

## 3. The naive instinct

```csharp
// "Count occurrences of each value"
foreach (var v in nums.Distinct())
{
    int count = 0;
    foreach (var n in nums)          // rescanning the whole array per value
        if (n == v) count++;
    Console.WriteLine($"{v}: {count}");
}
```

## 4. Why the naive approach is inferior

O(n * d) where d is the number of distinct values — O(n^2) when everything is
distinct. It also **reads the input many times**, which is fatal if the input is
a stream, a database cursor, or anything you cannot rewind.

The dictionary version is one pass, O(n), and works on a stream.

## 5. What to recognize

`Dictionary<TKey,TValue>` — hash table with a payload.

The three canonical shapes, worth memorizing as muscle:

```csharp
// (a) Frequency count
var freq = new Dictionary<char, int>();
foreach (char c in s)
    freq[c] = freq.GetValueOrDefault(c) + 1;

// (b) Grouping
var groups = new Dictionary<string, List<string>>();
foreach (var word in words)
{
    var key = Canonical(word);
    if (!groups.TryGetValue(key, out var list))
        groups[key] = list = new List<string>();
    list.Add(word);
}

// (c) Value -> index (the two-sum shape)
var seen = new Dictionary<int, int>();
for (int i = 0; i < nums.Length; i++)
{
    if (seen.TryGetValue(target - nums[i], out int j))
        return new[] { j, i };
    seen[nums[i]] = i;
}
```

Shape (c) is worth special attention: it is the answer to a startling number of
"find two things that relate" problems, and the instinct it replaces is always a
nested loop.

## 6. Complexity

| Operation | Average | Worst |
|---|---|---|
| `this[key]` get/set | O(1) | O(n) |
| `TryGetValue` | O(1) | O(n) |
| `ContainsKey` | O(1) | O(n) |
| `Add` / `TryAdd` | O(1) | O(n) |
| `Remove` | O(1) | O(n) |
| Enumerate | O(n) | O(n) |

Space O(n). Enumeration order is **undefined** — do not rely on it, even though
it frequently appears to be insertion order for dictionaries that never had a
removal. That coincidence has shipped a lot of bugs.

## 7. C# APIs worth knowing cold

```csharp
var d = new Dictionary<string, int>();

d["a"] = 1;                              // add or overwrite
d.Add("a", 1);                           // THROWS if key exists
bool ok = d.TryAdd("a", 1);              // false if exists, no throw

if (d.TryGetValue("a", out int v)) { }   // one lookup, preferred
int  x  = d.GetValueOrDefault("a");      // 0 if missing
int  x2 = d.GetValueOrDefault("a", -1);  // custom default

bool has = d.ContainsKey("a");
bool had = d.Remove("a");
bool had2 = d.Remove("a", out int old);  // removed value too

foreach (var (k, val) in d) { }          // deconstruction
d.Keys; d.Values; d.Count;

// Counting, most idiomatic:
d[key] = d.GetValueOrDefault(key) + 1;

// Counting, fastest (single hash lookup, .NET 6+):
ref int slot = ref CollectionsMarshal.GetValueRefOrAddDefault(d, key, out _);
slot++;
```

`CollectionsMarshal.GetValueRefOrAddDefault` is the senior-level detail: the
idiomatic `d[k] = d.GetValueOrDefault(k) + 1` hashes the key **twice**. The ref
version hashes once. Irrelevant in an interview, measurable in a hot loop.

Related types: `ConcurrentDictionary` (thread-safe, `AddOrUpdate`,
`GetOrAdd`), `FrozenDictionary` (.NET 8+, build-once/read-forever),
`ILookup` via `ToLookup` (immutable one-to-many), `SortedDictionary` (Book 08).

## 8. Common mistakes

1. **`d[key]` on a missing key throws** `KeyNotFoundException`. `TryGetValue` or
   `GetValueOrDefault` instead.
2. **`ContainsKey` then `d[key]`** — two lookups. `TryGetValue` does one. This
   is the most common review comment on C# dictionary code.
3. **`Add` when you meant assignment.** `Add` throws on a duplicate key.
4. **Mutating the collection while enumerating it.** Snapshot the keys first:
   `foreach (var k in d.Keys.ToList())`.
5. **Mutable keys.** Same trap as HashSet — mutate a field used by
   `GetHashCode` and the entry becomes unreachable.
6. **Missing comparer for string keys.** Default is ordinal, case-sensitive.
   `"Id"` and `"id"` are different keys and that surprises people.
7. **Value-type values are copies.** `d[k].Count++` on a struct value does not
   compile for a reason; with a class value it mutates shared state. Know which
   you have.
8. **Using Dictionary when a set would say it better** — if every value is
   `true`, you wanted a HashSet.

## 9. Problems where this is the correct book

- Two Sum — the archetype
- Group Anagrams — sorted word or 26-count as key
- Top K Frequent Elements — Dictionary to count, then heap/sort (07, 21)
- Valid Anagram — two frequency maps, or one map incremented then decremented
- First Unique Character — count, then rescan for the first with count 1
- Subarray Sum Equals K — prefix sum counts (11); pure Dictionary insight
- Longest Substring Without Repeating Characters — char to last index (10)
- Isomorphic Strings / Word Pattern — two maps enforcing a bijection
- LRU Cache — Dictionary + LinkedList (06)
- Memoized Fibonacci / any top-down DP (19)
- Roman to Integer — symbol to value map
- Ransom Note, Find All Anagrams in a String

## 10. Where Dictionary looks right but is the wrong choice

- **Presence only, no payload.** → HashSet (01). Using `Dictionary<T,bool>` is a
  code smell that reviewers will flag.
- **Keys are dense small integers `0..n`.** → a plain array. `int[26]` for
  lowercase letters beats `Dictionary<char,int>` on speed and allocation, and
  reads better. This is the most-missed simplification in string problems.
- **You need sorted-order iteration.** → SortedDictionary (08).
- **You need "the smallest key" repeatedly.** → PriorityQueue (07) or SortedSet.
- **The data is sorted and you want a pair.** → Two Pointers (09), O(1) space.
- **You only need the single most frequent element with a majority guarantee.**
  → Boyer–Moore voting, O(1) space.
- **You build it once from a query and read it once.** You may not need it at
  all — a single LINQ pass may be clearer.
- **Two-way lookup.** One dictionary is not enough; you need two, and you must
  keep them in sync. Consider whether the design is right.

---

## HashSet vs Dictionary — the decision, stated once

| Question you are answering | Structure |
|---|---|
| "Is it there?" | HashSet |
| "How many?" | `Dictionary<T,int>` |
| "Where?" | `Dictionary<T,int>` (index) |
| "Which ones share this property?" | `Dictionary<K,List<V>>` |
| "What did I compute for this input?" | `Dictionary<state,result>` |

If you catch yourself writing `Dictionary<T, bool>`, you wanted a HashSet.
If you catch yourself keeping a parallel `List` alongside a `HashSet` to
remember positions, you wanted a Dictionary.

## Production Lens

- **Comparer, again.** `StringComparer.Ordinal` is faster than the default for
  string keys and states intent. `OrdinalIgnoreCase` for user input.
- **Pre-size it.** `new Dictionary<K,V>(expectedCount)` avoids rehashing.
- **`FrozenDictionary`** for config/lookup tables loaded at startup.
- **Would `GroupBy` / `ToLookup` read better?** For a one-shot grouping, yes,
  usually. For an accumulating map inside a loop, no — the manual dictionary is
  clearer and cheaper.
- **Concurrency**: a plain Dictionary under concurrent writes does not merely
  race, it can corrupt internal state and infinite-loop on read.
  `ConcurrentDictionary` or a lock. This is a genuine production incident class.

**Related:** [[Book01-HashSet]], [[Book08-SortedSet-SortedDictionary]],
[[Book11-PrefixSum]], [[Book19-DynamicProgramming]], [[Book27-LINQ]],
[[Book29-Collections]].
