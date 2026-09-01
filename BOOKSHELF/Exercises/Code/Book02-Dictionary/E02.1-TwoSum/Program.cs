try
{
    Console.WriteLine(string.Join(", ", Solution.TwoSum([2, 7, 11, 15], 9)));  // expect 0, 1
    Console.WriteLine(string.Join(", ", Solution.TwoSum([3, 3], 6)));          // expect 0, 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
