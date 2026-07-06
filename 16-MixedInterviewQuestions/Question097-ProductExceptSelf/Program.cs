try
{
    var result = Solution.ProductExceptSelf(new[] { 1, 2, 3, 4 });
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}