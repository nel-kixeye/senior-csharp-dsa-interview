try
{
    var intervals = new[] { new[] {1,3}, new[] {2,6}, new[] {8,10}, new[] {15,18} };
    var result = Solution.Merge(intervals);
    foreach (var iv in result)
        Console.WriteLine($"[{iv[0]},{iv[1]}]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}