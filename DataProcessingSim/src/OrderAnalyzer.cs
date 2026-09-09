namespace DataProcessingSim;

public sealed class OrderAnalyzer
{
    public IReadOnlyList<OrderSummary> GetCompletedOrderSummaries(
        IEnumerable<Order> orders,
        string region)
        => throw new NotImplementedException();

    public IReadOnlyDictionary<string, decimal> GetCustomerSpend(
        IEnumerable<Order> orders)
        => throw new NotImplementedException();

    public IReadOnlyList<ProductSales> GetTopProducts(
        IEnumerable<Order> orders,
        int limit)
        => throw new NotImplementedException();

    public IReadOnlyList<string> GetDelayedOrderIds(
        IEnumerable<Order> orders,
        IEnumerable<ShipmentEvent> shipmentEvents,
        int deliveryWindowDays)
        => throw new NotImplementedException();
}
