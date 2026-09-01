try
{
    var result = Solution.Permute(new[] { 1, 2, 3 });
    foreach (var perm in result)
        Console.WriteLine(string.Join(", ", perm));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}