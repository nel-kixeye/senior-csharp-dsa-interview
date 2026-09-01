try
{
    Console.WriteLine(Solution.CustomSortString("cba", "abcd"));  // expect cbad (d anywhere)
    Console.WriteLine(Solution.CustomSortString("bcafg", "abcd"));// expect bcad (d anywhere)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
