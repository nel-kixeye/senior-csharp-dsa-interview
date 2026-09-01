try
{
    Console.WriteLine(Solution.EraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [1, 3]]));  // expect 1
    Console.WriteLine(Solution.EraseOverlapIntervals([[1, 2], [1, 2], [1, 2]]));          // expect 2
    Console.WriteLine(Solution.EraseOverlapIntervals([[1, 2], [2, 3]]));                  // expect 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
