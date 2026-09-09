using DataProcessingSim;
using Xunit;

namespace DataProcessingSim.Tests;

public sealed class OrderAnalyzerTests
{
    private readonly OrderAnalyzer analyzer = new();

    [Fact]
    public void CompletedSummaries_FilterSortAndCalculateTotals()
    {
        var orders = new[]
        {
            Order("O-2", "2026-08-02", "North", "Completed", 0.10m,
                Item("P-2", "B", 2, 10m)),
            Order("O-1", "2026-08-01", "North", "Completed", 0m,
                Item("P-1", "A", 1, 25m)),
            Order("O-3", "2026-08-01", "South", "Completed", 0m,
                Item("P-3", "C", 1, 5m)),
            Order("O-4", "2026-08-03", "North", "Cancelled", 0m,
                Item("P-4", "D", 1, 100m))
        };

        var result = analyzer.GetCompletedOrderSummaries(orders, "North");

        Assert.Equal(new[] { "O-1", "O-2" }, result.Select(x => x.OrderId));
        Assert.Equal(25m, result[0].Total);
        Assert.Equal(18m, result[1].Total);
        Assert.Equal(1, result[0].ItemCount);
        Assert.Equal(1, result[1].ItemCount);
    }

    [Fact]
    public void CompletedSummaries_IgnoreInvalidLines_AndClampDiscount()
    {
        var order = Order("O-1", "2026-08-01", "North", "Completed", 2m,
            Item("P-1", "valid", 2, 10m),
            Item("P-2", "zero", 0, 100m),
            Item("P-3", "negative", 1, -1m),
            new OrderItem("", "missing id", 1, 5m));

        var result = analyzer.GetCompletedOrderSummaries(new[] { order }, "North");

        Assert.Single(result);
        Assert.Equal(20m, result[0].Total);
        Assert.Equal(1, result[0].ItemCount);
    }

    [Fact]
    public void CompletedSummaries_HandleEmptyAndNullItems()
    {
        var orders = new[]
        {
            Order("O-1", "2026-08-01", "North", "Completed", 0m),
            OrderWithItems("O-2", "2026-08-02", "North", "Completed", 0m, "C-1", null)
        };

        var result = analyzer.GetCompletedOrderSummaries(orders, "North");

        Assert.Equal(2, result.Count);
        Assert.All(result, summary => Assert.Equal(0m, summary.Total));
        Assert.All(result, summary => Assert.Equal(0, summary.ItemCount));
    }

    [Fact]
    public void CustomerSpend_ExcludesNonCompletedAndKeepsZeroTotals()
    {
        var orders = new[]
        {
            Order("O-1", "2026-08-01", "North", "Completed", 0.25m,
                Item("P-1", "A", 2, 10m)),
            Order("O-2", "2026-08-02", "North", "Cancelled", 0m,
                Item("P-1", "A", 1, 100m)),
            Order("O-3", "2026-08-03", "North", "Completed", 0m),
            OrderWithItems("O-4", "2026-08-04", "North", "Completed", 0m, "C-1", null)
        };

        var result = analyzer.GetCustomerSpend(orders);

        Assert.Equal(15m, result["C-1"]);
        Assert.Equal(0m, result["C-3"]);
        Assert.Equal(0m, result["C-4"]);
        Assert.DoesNotContain("C-2", result.Keys);
    }

    [Fact]
    public void CustomerSpend_SkipsMissingCustomerIds_AndDuplicateOrdersAreProcessed()
    {
        var duplicate = Order("O-1", "2026-08-01", "North", "Completed", 0m,
            Item("P-1", "A", 1, 5m));
        var missingCustomer = duplicate with { CustomerId = "" };

        var result = analyzer.GetCustomerSpend(new[] { duplicate, duplicate, missingCustomer });

        Assert.Equal(10m, result["C-1"]);
        Assert.Single(result);
    }

    [Fact]
    public void ProductSales_CombinesProductsAndUsesTieBreakers()
    {
        var orders = new[]
        {
            Order("O-1", "2026-08-01", "North", "Completed", 0m,
                Item("P-2", "Second", 2, 5m),
                Item("P-1", "First", 1, 10m)),
            Order("O-2", "2026-08-02", "North", "Completed", 0m,
                Item("P-2", "Second", 1, 5m),
                Item("P-3", null, 3, 5m))
        };

        var result = analyzer.GetTopProducts(orders, 3);

        Assert.Equal(new[] { "P-1", "P-3", "P-2" }, result.Select(x => x.ProductId));
        Assert.Equal(3, result[2].Quantity);
        Assert.Equal("P-3", result[1].ProductName);
    }

    [Fact]
    public void ProductSales_ReturnsEmptyForNonPositiveLimitAndInvalidLines()
    {
        var order = Order("O-1", "2026-08-01", "North", "Completed", 0m,
            Item("P-1", "bad quantity", 0, 10m),
            Item("P-2", "bad price", 1, -1m));

        Assert.Empty(analyzer.GetTopProducts(new[] { order }, 0));
        Assert.Empty(analyzer.GetTopProducts(new[] { order }, 5));
    }

    [Fact]
    public void DelayedOrders_UsesLatestValidEventAndBoundaryIsOnTime()
    {
        var orders = new[]
        {
            Order("O-1", "2026-08-01", "North", "Completed", 0m),
            Order("O-2", "2026-08-01", "North", "PartiallyFulfilled", 0m),
            Order("O-3", "2026-08-01", "North", "Cancelled", 0m),
            Order("O-4", "2026-08-01", "North", "Completed", 0m)
        };
        var events = new[]
        {
            Event("O-1", "Delivered", "2026-08-08"),
            Event("O-1", "Shipped", "2026-08-02"),
            Event("O-2", "Delivered", "2026-08-09"),
            Event("O-3", "Delivered", "2026-08-20"),
            Event("O-4", "Delivered", "not-a-date"),
            Event("O-999", "Delivered", "2026-08-30")
        };

        var result = analyzer.GetDelayedOrderIds(orders, events, 7);

        Assert.Equal(new[] { "O-2", "O-4" }, result);
    }

    [Fact]
    public void DelayedOrders_DeduplicatesIdsAndHandlesMissingEvents()
    {
        var order = Order("O-1", "2026-08-01", "North", "Completed", 0m);
        var events = new[]
        {
            Event("O-1", "Shipped", "2026-08-02"),
            Event("O-1", "Shipped", "2026-08-02")
        };

        var result = analyzer.GetDelayedOrderIds(new[] { order, order }, events, 1);

        Assert.Equal(new[] { "O-1" }, result);
    }

    [Fact(Timeout = 2000)]
    public async Task Operations_HandleLargerInputWithinInterviewScale()
    {
        var orders = Enumerable.Range(1, 20_000)
            .Select(index => Order($"O-{index:D5}", "2026-08-01", "North", "Completed", 0m,
                Item($"P-{index % 25:D2}", "Product", 1, 1m)))
            .ToArray();

        var results = await Task.Run(() =>
        {
            var summaries = analyzer.GetCompletedOrderSummaries(orders, "North");
            var spend = analyzer.GetCustomerSpend(orders);
            var products = analyzer.GetTopProducts(orders, 10);
            return (summaries, spend, products);
        });

        Assert.Equal(20_000, results.summaries.Count);
        Assert.Single(results.spend);
        Assert.Equal(10, results.products.Count);
    }

    private static Order Order(
        string id,
        string date,
        string region,
        string status,
        decimal discount,
        params OrderItem[] items)
        => Order(id, date, region, status, discount, "C-1", items);

    private static Order OrderWithItems(
        string id,
        string date,
        string region,
        string status,
        decimal discount,
        string customerId,
        IReadOnlyList<OrderItem>? items)
        => new(id, DateTime.Parse(date), customerId, "Customer", region, status, discount, items);

    private static Order Order(
        string id,
        string date,
        string region,
        string status,
        decimal discount,
        string customerId,
        IReadOnlyList<OrderItem>? items)
        => new(id, DateTime.Parse(date), customerId, "Customer", region, status, discount, items);

    private static OrderItem Item(string id, string? name, int quantity, decimal price)
        => new(id, name, quantity, price);

    private static ShipmentEvent Event(string orderId, string eventType, string date)
        => new(orderId, "TRK", eventType, DateTime.TryParse(date, out var parsed) ? parsed : null, "Carrier");
}
