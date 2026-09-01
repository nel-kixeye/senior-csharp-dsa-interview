public record Item(int Id);
public record Order(int Id, List<Item> Items);
public record Customer(string Name);

// A minimal logger so this compiles without a DI container.
public interface ILoggerLike
{
    bool IsDebugEnabled { get; }
    void LogDebug(string message);
    void LogDebug(string template, params object[] args);
}

public static class Solution
{
    // THE SINGLE MOST COMMON REAL-WORLD VERSION OF THIS BOOK'S MISTAKE.
    //
    // In Notes.txt, explain what work happens here when Debug is DISABLED,
    // and why.
    public static void Log_Broken(ILoggerLike logger, Order order, Customer customer)
    {
        logger.LogDebug($"Processing order {order.Id} for customer {customer.Name} with {order.Items.Count} items");
    }

    // Rewrite it correctly.
    public static void Log(ILoggerLike logger, Order order, Customer customer)
    {
        throw new NotImplementedException();
    }

    // Then answer: name the SECOND benefit the correct form gives you that has
    // nothing to do with performance.
}
