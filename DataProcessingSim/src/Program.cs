using DataProcessingSim;

var dataDirectory = args.Length > 0
    ? Path.GetFullPath(args[0])
    : Path.Combine(AppContext.BaseDirectory, "data");

var ordersPath = Path.Combine(dataDirectory, "orders.json");
var shipmentEventsPath = Path.Combine(dataDirectory, "shipment-events.csv");

if (!File.Exists(ordersPath) || !File.Exists(shipmentEventsPath))
{
    Console.Error.WriteLine($"Data files were not found in: {dataDirectory}");
    Console.Error.WriteLine("Pass the data directory as the first argument, or run from the project output.");
    return 1;
}

var loader = new DataLoader();
var orders = loader.LoadOrders(ordersPath);
var shipmentEvents = loader.LoadShipmentEvents(shipmentEventsPath);

Console.WriteLine("Data Processing Interview Simulation");
Console.WriteLine($"Loaded {orders.Count} orders from {Path.GetFileName(ordersPath)}.");
Console.WriteLine($"Loaded {shipmentEvents.Count} shipment events from {Path.GetFileName(shipmentEventsPath)}.");
Console.WriteLine();
Console.WriteLine("The files are loaded and ready. Implement the tasks in OrderAnalyzer, then use this runner to inspect your results.");
Console.WriteLine("Orders and shipmentEvents are available in Program.cs for your task calls.");

try
{
    var analyzer = new OrderAnalyzer();
    _ = analyzer.GetCompletedOrderSummaries(orders, "North");
}
catch (NotImplementedException)
{
    Console.WriteLine("Task methods are not implemented yet.");
}

return 0;