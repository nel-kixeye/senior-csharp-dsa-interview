try
{
    Console.WriteLine(Solution.Search([4, 5, 6, 7, 0, 1, 2], 0));  // expect 4
    Console.WriteLine(Solution.Search([4, 5, 6, 7, 0, 1, 2], 3));  // expect -1
    Console.WriteLine(Solution.Search([1], 1));                     // expect 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
