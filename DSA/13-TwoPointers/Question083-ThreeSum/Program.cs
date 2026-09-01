try
{
    var result = Solution.ThreeSum(new[] { -1, 0, 1, 2, -1, -4 });
    foreach (var triplet in result)
        Console.WriteLine($"[{string.Join(", ", triplet)}]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}