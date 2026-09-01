# Book 27 — C# LINQ

> The book of *"say what you mean, not how to loop."*

LINQ is **not** a substitute for understanding algorithms. It is a vocabulary
for expressing intent. The training goal here is to recognize the *shape* of a
problem — "this is fundamentally a grouping problem" — and know that the shape
has a name.

The algorithm knowledge decides what is correct. LINQ decides how it reads.

## 1. What problem does this book solve?

Expressing data transformations declaratively, so the code states the intent
(filter, project, group, aggregate) rather than the mechanics of iteration.

## 2. Signals — shape to operator

| You are thinking | Operator |
|---|---|
| "Transform every element" | `Select` |
| "Keep only the ones that ..." | `Where` |
| "Flatten nested collections" | `SelectMany` |
| "**This is fundamentally a grouping problem**" | `GroupBy` |
| "Build a lookup keyed by ..." | `ToDictionary` / `ToLookup` |
| "Is there any ...?" | `Any` |
| "Are they all ...?" | `All` |
| "Does it contain ...?" | `Contains` |
| "Remove duplicates" | `Distinct` / `DistinctBy` |
| "Sort by, then by" | `OrderBy` / `ThenBy` |
| "Fold into a single value" | `Aggregate` |
| "The first matching, or nothing" | `FirstOrDefault` |
| "Exactly one, or it is a bug" | `SingleOrDefault` |
| "Count how many satisfy" | `Count(predicate)` |
| "Combine two sequences pairwise" | `Zip` |
| "Set operations" | `Union` / `Intersect` / `Except` |
| "Take a page / skip a page" | `Skip` / `Take` / `Chunk` |
| "Count occurrences of each" | `CountBy` (.NET 9) or `GroupBy` |

**`Single` vs `First` is a design statement.** `Single` says "exactly one exists,
and more than one is a bug I want to hear about." `First` says "there may be
several; give me one." Choosing deliberately documents an invariant.

## 3. The naive instinct

Two failure modes.

**Loops for everything**, including declarative work:

```csharp
var result = new List<string>();
foreach (var u in users)
    if (u.IsActive)
        result.Add(u.Name.ToUpper());
```

**LINQ for everything**, including things it does badly:

```csharp
// O(n^2) hidden behind pretty syntax
var dupes = nums.Where(n => nums.Count(x => x == n) > 1).Distinct();

// Recomputes the whole query on every enumeration
var q = source.Where(Expensive);
if (q.Any()) foreach (var x in q) { }      // Expensive runs twice
```

## 4. Why each is inferior

The manual loop is fine but says less: `users.Where(u => u.IsActive).Select(u => u.Name.ToUpper())` states the intent in one line.

The LINQ misuse is worse, because the O(n^2) is invisible. `nums.Count(...)`
inside a `Where` over the same collection is a nested loop with nice syntax.
That is exactly the anti-pattern this shelf exists to kill — **`Contains` and
`Count` inside a LINQ predicate over the same source are nested loops.**

## 5. What to recognize

**The grouping shape** — the highest-value recognition in this book:

```csharp
// "Group anagrams" — a grouping problem, so say GroupBy
var groups = words
    .GroupBy(w => new string(w.OrderBy(c => c).ToArray()))
    .Select(g => g.ToList())
    .ToList();

// "Count occurrences" — also grouping
var counts = words.GroupBy(w => w).ToDictionary(g => g.Key, g => g.Count());
// .NET 9:
var counts2 = words.CountBy(w => w);
```

**The set shape** (01):

```csharp
var seen = source.ToHashSet();
bool hasDup = nums.Length != nums.Distinct().Count();
var common = a.Intersect(b);        // uses a HashSet internally — O(n + m)
```

**Deferred execution** — the concept that causes the most LINQ bugs:

```csharp
var query = list.Where(x => x > 5);   // NOTHING has run yet
list.Add(10);                          // the query will see this
var result = query.ToList();           // NOW it runs
```

Deferred: `Where`, `Select`, `OrderBy`, `GroupBy`, `Take`, `Skip`.
Immediate: `ToList`, `ToArray`, `ToDictionary`, `Count`, `Any`, `First`, `Sum`.

**Useful modern additions:**

```csharp
items.DistinctBy(x => x.Id);          // .NET 6
items.MaxBy(x => x.Score);            // .NET 6 — returns the ITEM, not the value
items.MinBy(x => x.Score);
items.Chunk(100);                      // .NET 6 — batching
items.CountBy(x => x.Category);        // .NET 9
items.AggregateBy(...);                // .NET 9
first.Zip(second, (a, b) => a + b);
Enumerable.Range(0, n);
```

`MaxBy` versus `Max` is worth calling out: `Max(x => x.Score)` returns the
score; `MaxBy(x => x.Score)` returns the object. Before `MaxBy` existed people
wrote `OrderByDescending(...).First()`, which is O(n log n) for an O(n) job.

## 6. Complexity — know what each operator costs

| Operator | Cost | Notes |
|---|---|---|
| `Where`, `Select` | O(n) | streaming, lazy |
| `SelectMany` | O(total) | |
| `OrderBy` / `ThenBy` | O(n log n) | **allocates**, stable |
| `GroupBy` | O(n) | builds a hash lookup |
| `ToDictionary` / `ToHashSet` | O(n) | |
| `Distinct` | O(n) | HashSet internally |
| `Contains` on `IEnumerable` | **O(n)** | on `HashSet`/`Dictionary`: O(1) |
| `Any` / `First` | O(1)..O(n) | short-circuits |
| `Count()` | O(1) or O(n) | O(1) only if the source is `ICollection` |
| `Union` / `Intersect` / `Except` | O(n + m) | hash-based |
| `Aggregate` | O(n) | |
| `Reverse` | O(n) | buffers everything |

**The critical one:** `Contains` on a `List<T>` or a lazy sequence is O(n).
Inside a loop or a predicate, that is O(n^2). Materialize to a `HashSet` first
(01).

## 7. C# specifics

```csharp
// Method syntax (dominant in modern C#)
var r = items.Where(x => x.Ok).OrderBy(x => x.Name).Select(x => x.Id).ToList();

// Query syntax — genuinely better for joins and multiple range variables
var r2 = from o in orders
         join c in customers on o.CustomerId equals c.Id
         where o.Total > 100
         group o by c.Region into g
         select new { Region = g.Key, Total = g.Sum(x => x.Total) };

// ToLookup: one-to-many, immutable, missing keys return empty (not an exception)
var byCategory = products.ToLookup(p => p.Category);
foreach (var p in byCategory["nonexistent"]) { }    // safe, yields nothing

// ToDictionary throws on duplicate keys — that is often what you want
var byId = products.ToDictionary(p => p.Id);
```

`ToLookup` versus `ToDictionary` is a real design choice: `ToLookup` is
one-to-many and forgiving of missing keys; `ToDictionary` is one-to-one and
throws on duplicates, which surfaces a broken assumption early.

## 8. Common mistakes

1. **`Contains`/`Count` inside a predicate over the same source** — hidden
   O(n^2). The most common LINQ performance bug.
2. **Multiple enumeration.** Each `foreach` re-executes the query. If the source
   is a database or a generator, this is a correctness and cost bug. Materialize
   once with `ToList()`.
3. **Modifying the collection while enumerating** — `InvalidOperationException`.
4. **`OrderBy(...).First()`** where `MinBy`/`MaxBy` is O(n).
5. **`Count() > 0`** instead of `Any()` — `Count()` may enumerate everything.
6. **`ToDictionary` on a source with duplicate keys** — throws at runtime.
7. **Capturing a loop variable** in a deferred query, then enumerating later.
8. **Assuming `IEnumerable` is cheap to re-enumerate.**
9. **`Select` with side effects** — deferred execution makes when-it-runs
   non-obvious. Use a `foreach` for side effects.
10. **LINQ in a hot inner loop** — every operator allocates an enumerator and
    every lambda may allocate a closure.

## 9. Where LINQ genuinely reads better

- Filtering, projecting, and grouping a collection once
- Multi-key sorting: `OrderBy(...).ThenBy(...)`
- Set operations
- Aggregations: `Sum`, `Average`, `Max`, `Count`
- Joins across two collections
- Anything already expressed as "for each X where Y, give me Z"
- Building a lookup from a query result

## 10. Where a plain loop is better

- **Hot paths** — allocation and delegate-call overhead are measurable.
- **You need index arithmetic** — two pointers, sliding windows, prefix sums.
  LINQ has no notion of "the previous element."
- **Early exit with complex conditions** — a `foreach` with `break` is clearer.
- **Building interdependent state** — an accumulating dictionary in a loop is
  clearer than a contorted `Aggregate`.
- **Multiple outputs from one pass** — LINQ pushes you toward multiple passes.
- **The algorithm is the point** — writing Two Sum with `SelectMany` over all
  pairs is O(n^2) dressed as elegance.
- **Debugging matters** — stepping through a loop beats stepping through a
  deferred chain.

**The rule:** LINQ for *what*, loops for *how*. If the operation has a name in
the vocabulary above, use the name. If you are describing a mechanism —
pointers, windows, accumulation — write the loop.

---

## Production Lens

**`IEnumerable` vs `IQueryable` is the biggest one.** On `IQueryable` (EF Core),
LINQ becomes SQL. The moment you call `.ToList()`, `.AsEnumerable()`, or use a
method EF cannot translate, execution moves to memory — and a `Where` after that
point filters *after* pulling every row. That is the classic performance
incident.

```csharp
ctx.Orders.Where(o => o.Total > 100).ToList();   // WHERE in SQL — good
ctx.Orders.ToList().Where(o => o.Total > 100);   // pulls the whole table — bad
```

Also: `Select` before `ToList` to avoid over-fetching columns; watch for N+1
queries from lazy navigation properties inside a `Select`; and remember that
LINQ-to-Objects string comparison is ordinal while LINQ-to-SQL uses the
database's collation — the same query can give different results in tests and
production.

**Related:** [[Book01-HashSet]], [[Book02-Dictionary]], [[Book21-Sorting]],
[[Book29-Collections]], [[Book33-BuiltInMethods]].
