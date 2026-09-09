namespace DataProcessingSim;

public sealed record Order(
    string OrderId,
    DateTime OrderDate,
    string CustomerId,
    string? CustomerName,
    string Region,
    string Status,
    decimal Discount,
    IReadOnlyList<OrderItem>? Items);

public sealed record OrderItem(
    string ProductId,
    string? ProductName,
    int Quantity,
    decimal UnitPrice);

public sealed record ShipmentEvent(
    string OrderId,
    string? TrackingNumber,
    string EventType,
    DateTime? EventAt,
    string? Carrier);

public sealed record OrderSummary(
    string OrderId,
    DateTime OrderDate,
    decimal Total,
    int ItemCount);

public sealed record ProductSales(
    string ProductId,
    string ProductName,
    int Quantity,
    decimal Revenue);
