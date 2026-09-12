namespace DataProcessingSim.Models;

public class Orders
{
    public string OrderId {get; set;} = "";
    public DateTime OrderDate {get;set;}
    public string CustomerId {get;set;} = "";
    public string CustomerName {get;set;} = "";
    public string Region {get;set;} = "";
    public string Status {get; set;} = "";
    public double Discount {get;set;}
    public List<Items> Items{get; set;}
}

public class Items
{
    public string ProductId {get;set;} = "";
    public string ProductName {get; set;} = "";
    public int Quantity {get;set;}
    public double UnitPrice {get;set;}
}

public class OrderReport
{
    public string OrderId {get;set;} = string.Empty;
    public DateTime OrderDate {get;set;}
    public int ValidItemsCount {get;set;}
    public double DiscountedTotal {get;set;}
}

public class CustomerSpendingReport
{
    public string CustomerId {get;set;} = string.Empty;
    public string CustomerName {get;set;} = string.Empty;
    public double TotalSpending {get;set;}
}

public class ProductSalesRanking
{
    public string ProductId {get;set;} = string.Empty;
    public string ProductName {get;set;} = string.Empty;
    public int TotalQuantitySold {get;set;}
    public double TotalDiscountedRevenue {get;set;}

}