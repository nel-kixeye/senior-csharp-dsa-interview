public record Order(int Id, decimal Total, string CustomerName);

public static class Solution
{
    // Against an EF Core DbSet<Order>, these two look nearly identical.
    // ONE is fine. ONE is a production incident.
    //
    //     var a = ctx.Orders.Where(o => o.Total > 100).ToList();
    //     var b = ctx.Orders.ToList().Where(o => o.Total > 100);
    //
    // In Notes.txt, answer:
    //   1. What SQL does each generate, and how much data crosses the wire?
    //   2. How would you also avoid over-fetching COLUMNS when you only need
    //      Id and Total?
    //   3. Name one way an IQueryable chain can silently degrade into
    //      client-side evaluation, and how you would catch it before production.

    // Write the version that filters in SQL and projects only the needed columns.
    public static IQueryable<(int Id, decimal Total)> HighValue(IQueryable<Order> orders)
        => throw new NotImplementedException();
}
