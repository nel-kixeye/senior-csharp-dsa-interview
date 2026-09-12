using System.Text.Json;
using DataProcessingSim.Models;

internal class Program
{
    private static void Main(string[] args)
    {
        var jsonSerializerOption = new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true
        };
        var file = File.ReadAllText(@".\data\orders.json");
        var data = JsonSerializer.Deserialize<List<Orders>>(file, jsonSerializerOption);
        if(data is not {}) return;
        var filteredData = CompletedData(data);
        var completedReports = CompletedOrderReport(filteredData, "west");
        Console.WriteLine("CompletedOrderReport");
        var customerSpendingReport = CustomerSpendingReport(filteredData);
        Console.WriteLine("CustomerSpendingReport");
        var productSalesRanking = ProductSalesRanking(data, 3);
        Console.WriteLine("ProductSalesRanking");
    }

    private static List<Orders> CompletedData(List<Orders> data)
    {
        return [.. data
            .Where(x => x.Status.Equals("Completed", StringComparison.InvariantCultureIgnoreCase))
            .DistinctBy(x => x.OrderId)
            .OrderBy(x => x.OrderDate)];
    }

    private static List<Items> ValidItems(List<Items> items)
    {
        return [.. items.Where(y => y.ProductId is {} && 
                                    y.Quantity > 0 &&
                                    y.UnitPrice > 0)];
    }

    private static List<OrderReport> CompletedOrderReport(List<Orders> data, string region)
    {
        var filteredData = data
            .Where(x => x.Region.Equals(region, StringComparison.CurrentCultureIgnoreCase))
            .Select(x =>
            {
                var validItems = ValidItems(x.Items);
                var discount = validItems.Sum(y => y.UnitPrice * y.Quantity);
                var discountTotal = discount * (1 - x.Discount);
                return new OrderReport
                    {
                        OrderId = x.OrderId,
                        OrderDate = x.OrderDate,
                        ValidItemsCount = validItems.Count(),
                        DiscountedTotal = discountTotal
                    };
            })
            .Where(z => z.ValidItemsCount > 0)
            .ToList();
        return filteredData;
    }

    private static List<CustomerSpendingReport> CustomerSpendingReport(List<Orders> data)
    {
        var filteredData = data.Where(x => !string.IsNullOrEmpty(x.CustomerId))
            .Select(y =>
            {
                var validItems = ValidItems(y.Items);
                var spending = validItems.Sum(z => z.UnitPrice * z.Quantity);
                var discountedSpending = spending * (1 - y.Discount);
                return new CustomerSpendingReport
                {
                    CustomerId = y.CustomerId,
                    CustomerName = y.CustomerName,
                    TotalSpending = discountedSpending
                };
            })
            .ToList();
        return filteredData;
    }

    private static List<ProductSalesRanking> ProductSalesRanking(List<Orders> data, int limit)
    {
      if (limit <= 0)
        return [];

    return [.. data
        .Where(x => x.Status.Equals(
            "Completed",
            StringComparison.InvariantCultureIgnoreCase))
        .SelectMany(order => ValidItems(order.Items)
            .Select(item => new
            {
                Item = item,
                Discount = Math.Clamp(order.Discount, 0, 1)
            }))
        .GroupBy(x => x.Item.ProductId)
        .Select(group => new ProductSalesRanking
        {
            ProductId = group.Key,
            ProductName = group
                .Select(x => x.Item.ProductName)
                .FirstOrDefault(x => !string.IsNullOrWhiteSpace(x))
                ?? group.Key,
            TotalQuantitySold = group.Sum(x => x.Item.Quantity),
            TotalDiscountedRevenue = group.Sum(x =>
                x.Item.UnitPrice *
                x.Item.Quantity *
                (1 - x.Discount))
        })
        .OrderByDescending(x => x.TotalDiscountedRevenue)
        .ThenByDescending(x => x.TotalQuantitySold)
        .ThenBy(x => x.ProductId)
        .Take(limit)
    ];

    }
}