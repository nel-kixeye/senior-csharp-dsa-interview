# Exercises — Book 27: LINQ

**Different in character.** These are rewrite, code-review, and judgment
exercises — the skill is recognizing a problem's *shape* and knowing whether LINQ
or a loop expresses it better.

**The rule:** LINQ for *what*, loops for *how*.

---

### E27.1 — Name the shape, then write it
For each description, name the operator(s) and write the one-liner. Then say
whether a loop would read better.

1. From a list of orders, get the total value of orders placed this year.
2. From a list of users, get the distinct department names.
3. From a list of teams (each with a list of members), get every member in one
   flat sequence.
4. From a list of products, build a lookup from category to the products in it.
5. From a list of employees, find the one with the highest salary — the
   **employee**, not the salary.
6. Determine whether every order in a list has been paid.
7. Split a list of 10,000 ids into batches of 500 for a bulk API call.

- **Before you code:** for #5, there are two ways and one is O(n log n) for an
  O(n) job. Name both.

### E27.2 — Find the hidden O(n²)
This compiles, passes tests on small inputs, and is quadratic. Find why, and fix
it without changing the result.

```csharp
var duplicates = numbers
    .Where(n => numbers.Count(x => x == n) > 1)
    .Distinct()
    .ToList();
```

- **Before you code:** state the complexity of the original and of your fix. Then
  name the general rule this violates — it applies to `Contains` as much as
  `Count`.

### E27.3 — The multiple-enumeration bug
Review this. There are **two** distinct problems, one performance and one
correctness-under-certain-sources.

```csharp
public void Process(IEnumerable<Order> orders)
{
    if (orders.Count() == 0) return;
    _logger.LogInformation("Processing {Count} orders", orders.Count());
    foreach (var o in orders.Where(o => o.IsValid))
        Handle(o);
    var total = orders.Sum(o => o.Amount);
}
```

- **Before you code:** how many times is `orders` enumerated? What if `orders` is
  a database query, or a generator that reads a file? Fix both problems.

### E27.4 — `ToDictionary` vs `ToLookup` vs `GroupBy`
For each scenario, choose one and justify it in a sentence:

1. Building a cache of users keyed by their unique id, where a duplicate id
   indicates a bug you want to hear about immediately.
2. Building a map from category to all products in it, where a category with no
   products should return an empty sequence rather than throw.
3. Producing a report of sales totals per region, consumed once and discarded.
4. A lookup from country code to country name, loaded at startup and read
   millions of times over the process lifetime.

- **Before you code:** two of these have a *different* right answer in production
  than the naive LINQ one. Which, and what would you use instead?

### E27.5 — `IEnumerable` vs `IQueryable`
These two lines look nearly identical against an EF Core `DbSet`. One is fine and
one is a production incident.

```csharp
var a = ctx.Orders.Where(o => o.Total > 100).ToList();
var b = ctx.Orders.ToList().Where(o => o.Total > 100);
```

- **Explain:** exactly what SQL each generates and how much data crosses the wire.
- **Then:** write a version that also avoids over-fetching *columns* when you only
  need `Id` and `Total`.
- **Then:** describe one way an `IQueryable` chain can silently degrade into
  client-side evaluation, and how you would catch it before production.

---
---

# ⛔ STOP — hints below

---

**E27.1**
1. `orders.Where(o => o.Date.Year == year).Sum(o => o.Total)`
2. `users.Select(u => u.Department).Distinct()` — or `DistinctBy(u => u.Department)`
   if you want whole users.
3. `teams.SelectMany(t => t.Members)`
4. `products.ToLookup(p => p.Category)`
5. `employees.MaxBy(e => e.Salary)` — O(n). The common wrong version is
   `employees.OrderByDescending(e => e.Salary).First()`, which is O(n log n) and
   allocates a full sorted buffer.
6. `orders.All(o => o.IsPaid)`
7. `ids.Chunk(500)` (.NET 6+)
- Loops read better for #1 only if you also need other aggregates in the same
  pass — LINQ pushes you toward multiple passes.

**E27.2**
- *The bug:* `numbers.Count(...)` re-scans the **entire** source for every element,
  inside a `Where` that is already O(n). O(n²).
- *Fix:*
  ```
  var duplicates = numbers.GroupBy(n => n).Where(g => g.Count() > 1).Select(g => g.Key).ToList();
  ```
  O(n), one pass, and it says "grouping problem" out loud.
- *The rule:* **never call `Contains`, `Count`, or `Any` over the same source
  inside a predicate applied to that source.** That is a nested loop with nice
  syntax.

**E27.3**
- *Enumerations:* four — `Count()`, `Count()` again, the `foreach`, and `Sum()`.
- *Performance:* four passes over what may be an expensive source.
- *Correctness:* if `orders` is a deferred query, each enumeration **re-executes**
  it — four database round trips, and the data may differ between them. If it is a
  one-shot generator (a file reader), the later enumerations yield **nothing**.
- *Fix:* materialize once at the top —
  ```
  var list = orders as IReadOnlyList<Order> ?? orders.ToList();
  if (list.Count == 0) return;    // Count property, not Count() method
  ```
  Also prefer `Any()` over `Count() == 0` in general.

**E27.4**
1. `ToDictionary` — it **throws** on a duplicate key, which is exactly the
   fail-fast behaviour wanted.
2. `ToLookup` — one-to-many, and a missing key yields an empty sequence rather
   than throwing.
3. `GroupBy` — consumed once, no need to materialize a lookup structure.
4. `ToFrozenDictionary()` (.NET 8+) — build once, read forever; slower to build,
   faster to probe than `Dictionary`.
- *Production differences:* #4 (frozen rather than plain `Dictionary`), and #1 if
  the source is untrusted — you may want `GroupBy` + explicit duplicate reporting
  rather than an exception that only says "duplicate key".

**E27.5**
- *`a`:* the `Where` is part of the `IQueryable` expression tree, so EF translates
  it to `SELECT * FROM Orders WHERE Total > 100`. Only matching rows cross the
  wire.
- *`b`:* `ToList()` materializes the **entire table** first, then filters in
  memory. On a large table this is the incident.
- *Columns:* `ctx.Orders.Where(o => o.Total > 100).Select(o => new { o.Id, o.Total }).ToList()`
  — the projection becomes `SELECT Id, Total`.
- *Silent degradation:* calling a method EF cannot translate (a custom C# helper,
  some string operations) inside a `Where`. Modern EF Core **throws** on
  unsupported client evaluation rather than silently degrading — but you can still
  slip into it via `AsEnumerable()`. Catch it by logging generated SQL in
  development and asserting on query counts in integration tests.
