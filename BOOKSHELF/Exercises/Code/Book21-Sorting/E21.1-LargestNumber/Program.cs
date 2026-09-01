try
{
    Console.WriteLine(Solution.LargestNumber([10, 2]));            // expect 210
    Console.WriteLine(Solution.LargestNumber([3, 30, 34, 5, 9]));  // expect 9534330
    Console.WriteLine(Solution.LargestNumber([0, 0]));             // expect 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
