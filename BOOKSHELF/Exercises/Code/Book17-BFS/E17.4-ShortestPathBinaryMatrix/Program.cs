try
{
    Console.WriteLine(Solution.ShortestPathBinaryMatrix([[0, 1], [1, 0]]));            // expect 2
    Console.WriteLine(Solution.ShortestPathBinaryMatrix([[0, 0, 0], [1, 1, 0], [1, 1, 0]])); // expect 4
    Console.WriteLine(Solution.ShortestPathBinaryMatrix([[1, 0], [0, 0]]));            // expect -1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
