try
{
    Console.WriteLine(string.Join(", ", Solution.TopKFrequent([1, 1, 1, 2, 2, 3], 2))); // expect 1, 2
    Console.WriteLine(string.Join(", ", Solution.TopKFrequent([1], 1)));                // expect 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
