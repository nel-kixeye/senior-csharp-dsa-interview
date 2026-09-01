try
{
    var a = new[] { 1, 2, 2, 1 };
    var b = new[] { 2, 2 };
    var result = Solution.Intersection(a, b);
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}