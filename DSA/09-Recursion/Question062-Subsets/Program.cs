try
{
    var result = Solution.Subsets(new[] { 1, 2, 3 });
    foreach (var subset in result)
        Console.WriteLine("[" + string.Join(", ", subset) + "]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}