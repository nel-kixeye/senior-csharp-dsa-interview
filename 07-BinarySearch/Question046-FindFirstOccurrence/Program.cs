try
{
    Console.WriteLine(Solution.FindFirst(new[] { 1, 2, 2, 2, 3, 4 }, 2));
    Console.WriteLine(Solution.FindFirst(new[] { 1, 2, 3 }, 5));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}