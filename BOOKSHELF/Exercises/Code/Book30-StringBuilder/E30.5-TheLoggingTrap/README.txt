The logging trap

This is the single most common real-world version of this book's mistake.

csharp
_logger.LogDebug($"Processing order {order.Id} for customer {customer.Name} with {order.Items.Count} items");

- Explain: what work happens here when the Debug level is disabled, and
  why.
- Rewrite it correctly.
- Then: name the second benefit the correct form gives you that has nothing to
  do with performance.


----
Guide: BOOKSHELF/Exercises/Book30-StringBuilder.md  (hints at the bottom of that file)
