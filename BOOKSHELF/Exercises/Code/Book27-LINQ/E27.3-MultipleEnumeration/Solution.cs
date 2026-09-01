public record Order(int Id, decimal Amount, bool IsValid);

public static class Solution
{
    // REVIEW THIS. There are TWO distinct problems - one performance, one
    // correctness-under-certain-sources.
    //
    // How many times is `orders` enumerated?
    // What if it is a database query, or a generator reading a file?
    public static decimal Process_Broken(IEnumerable<Order> orders, Action<Order> handle)
    {
        if (orders.Count() == 0) return 0;
        Console.WriteLine($"Processing {orders.Count()} orders");
        foreach (var o in orders.Where(o => o.IsValid))
            handle(o);
        return orders.Sum(o => o.Amount);
    }

    // Your fix: same behaviour, ONE enumeration.
    public static decimal Process(IEnumerable<Order> orders, Action<Order> handle)
    {
        throw new NotImplementedException();
    }
}
