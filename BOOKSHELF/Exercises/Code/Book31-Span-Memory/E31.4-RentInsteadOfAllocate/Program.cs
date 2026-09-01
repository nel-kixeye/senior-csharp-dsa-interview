var message = new byte[1024];
Random.Shared.NextBytes(message);

var before = GC.GetTotalAllocatedBytes();
for (int i = 0; i < 1000; i++) Solution.Process_Broken(message);
Console.WriteLine($"broken: {(GC.GetTotalAllocatedBytes() - before) / 1024 / 1024} MB allocated");

try
{
    before = GC.GetTotalAllocatedBytes();
    for (int i = 0; i < 1000; i++) Solution.Process(message);
    Console.WriteLine($"pooled: {(GC.GetTotalAllocatedBytes() - before) / 1024} KB allocated");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
