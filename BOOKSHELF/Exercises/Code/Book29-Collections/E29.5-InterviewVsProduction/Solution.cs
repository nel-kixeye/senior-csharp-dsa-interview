public record User(int Id, string Name);
public record Order(int Id);
public record WorkItem(int Id);

// A custom key type - note that it is a CLASS.
public class CustomerId
{
    public int Value { get; init; }
}

public static class Solution
{
    // For each: give BOTH the interview answer and the production answer, and
    // say what changes between them. Record in Notes.txt, then fix the code.

    // 1. What would you add in production?
    public static Dictionary<string, User> Cache_Interview() => new();
    public static Dictionary<string, User> Cache_Production() => throw new NotImplementedException();

    // 2. A `visited` set for a graph traversal over dense int ids 0..n-1.
    public static object Visited_Production(int nodeCount) => throw new NotImplementedException();

    // 3. Public service method return type. What should this be?
    public static List<Order> GetOrders_Interview() => [];
    public static IReadOnlyList<Order> GetOrders_Production() => throw new NotImplementedException();

    // 4. A background processing pipeline. Queue<WorkItem> is the interview
    //    answer. What is the production one, and what does it give you?
    public static object Pipeline_Production() => throw new NotImplementedException();

    // 5. Dictionary<CustomerId, decimal> where CustomerId is the class above.
    //    Something is badly wrong. What, and what are the three fixes?
    public static bool DemonstrateTheBug()
    {
        var a = new CustomerId { Value = 1 };
        var b = new CustomerId { Value = 1 };
        var d = new Dictionary<CustomerId, decimal> { [a] = 100m };
        return d.ContainsKey(b);       // what does this return, and why?
    }
}
