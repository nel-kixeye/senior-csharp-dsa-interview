var dataDirectory = args.Length > 0
    ? Path.GetFullPath(args[0])
    : Path.Combine(AppContext.BaseDirectory, "data");

var ordersPath = Path.Combine(dataDirectory, "orders.json");
var shipmentEventsPath = Path.Combine(dataDirectory, "shipment-events.csv");

if (!File.Exists(ordersPath) || !File.Exists(shipmentEventsPath))
{
    Console.Error.WriteLine($"Data files were not found in: {dataDirectory}");
    Console.Error.WriteLine("Pass the data directory as the first argument.");
    return 1;
}

var ordersJson = File.ReadAllText(ordersPath);
var shipmentEventLines = File.ReadAllLines(shipmentEventsPath);

Console.WriteLine("Data Processing Interview Simulation");
Console.WriteLine($"Orders file: {ordersJson.Length:N0} characters");
Console.WriteLine($"Shipment file: {shipmentEventLines.Length:N0} lines");
Console.WriteLine();
Console.WriteLine("Read the assignment, build your models, parse the files, and implement the four tasks.");

return 0;