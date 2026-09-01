try
{
    Console.WriteLine(Solution.CanCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]));  // expect 3
    Console.WriteLine(Solution.CanCompleteCircuit([2, 3, 4], [3, 4, 3]));              // expect -1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
