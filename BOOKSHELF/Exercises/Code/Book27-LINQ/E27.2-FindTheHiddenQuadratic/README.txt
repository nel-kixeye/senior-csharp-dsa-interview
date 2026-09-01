Find the hidden O(n²)

This compiles, passes tests on small inputs, and is quadratic. Find why, and fix
it without changing the result.

csharp
var duplicates = numbers
    .Where(n => numbers.Count(x => x == n) > 1)
    .Distinct()
    .ToList();


----
Guide: BOOKSHELF/Exercises/Book27-LINQ.md  (hints at the bottom of that file)
