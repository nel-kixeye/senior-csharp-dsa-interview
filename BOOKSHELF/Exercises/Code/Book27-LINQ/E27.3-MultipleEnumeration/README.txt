The multiple-enumeration bug

Review this. There are two distinct problems, one performance and one
correctness-under-certain-sources.

csharp
public void Process(IEnumerable<Order> orders)
{
    if (orders.Count() == 0) return;
    _logger.LogInformation("Processing {Count} orders", orders.Count());
    foreach (var o in orders.Where(o => o.IsValid))
        Handle(o);
    var total = orders.Sum(o => o.Amount);
}


----
Guide: BOOKSHELF/Exercises/Book27-LINQ.md  (hints at the bottom of that file)
