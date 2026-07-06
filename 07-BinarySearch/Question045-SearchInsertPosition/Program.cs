try
{
    Console.WriteLine(Solution.SearchInsert(new[] { 1, 3, 5, 6 }, 5));
    Console.WriteLine(Solution.SearchInsert(new[] { 1, 3, 5, 6 }, 2));
    Console.WriteLine(Solution.SearchInsert(new[] { 1, 3, 5, 6 }, 7));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}