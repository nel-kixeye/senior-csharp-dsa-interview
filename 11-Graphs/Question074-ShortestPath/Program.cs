try
{
    var graph = new Dictionary<int, List<int>>
    {
        { 0, new List<int> { 1, 2 } },
        { 1, new List<int> { 0, 3 } },
        { 2, new List<int> { 0, 3 } },
        { 3, new List<int> { 1, 2, 4 } },
        { 4, new List<int> { 3 } }
    };
    Console.WriteLine(Solution.ShortestPath(graph, 0, 4));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}