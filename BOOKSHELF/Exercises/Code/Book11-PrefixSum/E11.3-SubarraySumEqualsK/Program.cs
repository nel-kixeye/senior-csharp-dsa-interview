try
{
    Console.WriteLine(Solution.SubarraySum([1, 1, 1], 2));      // expect 2
    Console.WriteLine(Solution.SubarraySum([1, 2, 3], 3));      // expect 2
    Console.WriteLine(Solution.SubarraySum([1, -1, 0], 0));     // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
