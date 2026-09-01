try
{
    Console.WriteLine(Solution.CanFinish(2, [[1, 0]]));           // expect True
    Console.WriteLine(Solution.CanFinish(2, [[1, 0], [0, 1]]));   // expect False (cycle)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
