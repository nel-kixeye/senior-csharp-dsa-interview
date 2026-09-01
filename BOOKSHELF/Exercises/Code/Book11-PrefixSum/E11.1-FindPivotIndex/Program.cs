try
{
    Console.WriteLine(Solution.PivotIndex([1, 7, 3, 6, 5, 6]));  // expect 3
    Console.WriteLine(Solution.PivotIndex([1, 2, 3]));           // expect -1
    Console.WriteLine(Solution.PivotIndex([2, 1, -1]));          // expect 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
