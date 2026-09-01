int enumerations = 0;

IEnumerable<Order> Source()
{
    enumerations++;                       // counts each full enumeration
    yield return new Order(1, 10m, true);
    yield return new Order(2, 20m, false);
    yield return new Order(3, 30m, true);
}

enumerations = 0;
Solution.Process_Broken(Source(), _ => { });
Console.WriteLine($"broken enumerated the source {enumerations} times");   // expect 4

try
{
    enumerations = 0;
    Solution.Process(Source(), _ => { });
    Console.WriteLine($"fixed enumerated the source {enumerations} times");  // expect 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
