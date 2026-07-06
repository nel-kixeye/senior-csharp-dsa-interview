try
{
    var freq = Solution.CharFrequency("hello");
    foreach (var kv in freq)
        Console.WriteLine($"{kv.Key}: {kv.Value}");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}