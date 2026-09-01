public record User(int Id, string Name);
public record Product(int Id, string Category, string Name);
public record Sale(string Region, decimal Amount);

public static class Solution
{
    // For each scenario choose ToDictionary / ToLookup / GroupBy and JUSTIFY it
    // in one sentence in Notes.txt. Then implement.

    // 1. Cache of users keyed by unique id. A duplicate id is a BUG you want to
    //    hear about immediately.
    public static Dictionary<int, User> UserCache(IEnumerable<User> users)
        => throw new NotImplementedException();

    // 2. Map from category to all products in it. A category with no products
    //    must return an EMPTY sequence, not throw.
    public static ILookup<string, Product> ProductsByCategory(IEnumerable<Product> products)
        => throw new NotImplementedException();

    // 3. Sales totals per region, consumed ONCE and discarded.
    public static IEnumerable<(string Region, decimal Total)> RegionTotals(IEnumerable<Sale> sales)
        => throw new NotImplementedException();

    // 4. Country code -> name, loaded at startup, read millions of times.
    //    The naive LINQ answer is NOT the production answer. Which is it?
    public static IReadOnlyDictionary<string, string> CountryLookup(IEnumerable<(string Code, string Name)> rows)
        => throw new NotImplementedException();
}
