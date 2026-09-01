try
{
    foreach (var c in Solution.CombinationSum([2, 3, 6, 7], 7))
        Console.WriteLine($"[{string.Join(",", c)}]");
    // expect [2,2,3] and [7]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
