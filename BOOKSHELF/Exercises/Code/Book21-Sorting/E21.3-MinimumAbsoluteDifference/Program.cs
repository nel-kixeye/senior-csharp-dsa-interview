try
{
    foreach (var p in Solution.MinimumAbsDifference([4, 2, 1, 3]))
        Console.Write($"[{p[0]},{p[1]}] ");
    Console.WriteLine();
    // expect [1,2] [2,3] [3,4]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
