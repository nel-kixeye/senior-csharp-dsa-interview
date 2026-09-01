try
{
    Console.WriteLine(string.Join(", ", Solution.TwoSum([2, 7, 11, 15], 9)));  // expect 1, 2
    Console.WriteLine(string.Join(", ", Solution.TwoSum([-1, 0], -1)));        // expect 1, 2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
