try
{
    Console.WriteLine(Solution.FindMaxAverage([1, 12, -5, -6, 50, 3], 4));  // expect 12.75
    Console.WriteLine(Solution.FindMaxAverage([5], 1));                     // expect 5
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
