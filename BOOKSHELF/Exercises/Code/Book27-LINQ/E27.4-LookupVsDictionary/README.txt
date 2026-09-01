`ToDictionary` vs `ToLookup` vs `GroupBy`

For each scenario, choose one and justify it in a sentence:

1. Building a cache of users keyed by their unique id, where a duplicate id
   indicates a bug you want to hear about immediately.
2. Building a map from category to all products in it, where a category with no
   products should return an empty sequence rather than throw.
3. Producing a report of sales totals per region, consumed once and discarded.
4. A lookup from country code to country name, loaded at startup and read
   millions of times over the process lifetime.


----
Guide: BOOKSHELF/Exercises/Book27-LINQ.md  (hints at the bottom of that file)
