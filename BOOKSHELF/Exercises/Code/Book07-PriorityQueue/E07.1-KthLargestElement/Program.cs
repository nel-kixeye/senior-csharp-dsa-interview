try
{
    Console.WriteLine(Solution.FindKthLargest([3, 2, 1, 5, 6, 4], 2));        // expect 5
    Console.WriteLine(Solution.FindKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4));// expect 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
