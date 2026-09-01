try
{
    var all = Solution.Subsets([1, 2, 3]);
    Console.WriteLine($"count = {all.Count}");   // expect 8
    foreach (var s in all) Console.WriteLine($"[{string.Join(",", s)}]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
