`IEnumerable` vs `IQueryable`

These two lines look nearly identical against an EF Core DbSet. One is fine and
one is a production incident.

csharp
var a = ctx.Orders.Where(o => o.Total > 100).ToList();
var b = ctx.Orders.ToList().Where(o => o.Total > 100);

- Explain: exactly what SQL each generates and how much data crosses the wire.
- Then: write a version that also avoids over-fetching *columns* when you only
  need Id and Total.
- Then: describe one way an IQueryable chain can silently degrade into
  client-side evaluation, and how you would catch it before production.


----
Guide: BOOKSHELF/Exercises/Book27-LINQ.md  (hints at the bottom of that file)
