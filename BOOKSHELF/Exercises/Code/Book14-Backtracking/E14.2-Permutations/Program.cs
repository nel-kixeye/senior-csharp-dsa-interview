try
{
    var all = Solution.Permute([1, 2, 3]);
    Console.WriteLine($"count = {all.Count}");   // expect 6
    foreach (var p in all) Console.WriteLine($"[{string.Join(",", p)}]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
