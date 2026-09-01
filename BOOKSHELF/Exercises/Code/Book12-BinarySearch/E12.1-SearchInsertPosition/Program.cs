try
{
    Console.WriteLine(Solution.SearchInsert([1, 3, 5, 6], 5));  // expect 2
    Console.WriteLine(Solution.SearchInsert([1, 3, 5, 6], 2));  // expect 1
    Console.WriteLine(Solution.SearchInsert([1, 3, 5, 6], 7));  // expect 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
