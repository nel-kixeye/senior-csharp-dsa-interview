try
{
    var graph = new Dictionary<int, List<int>>
    {
        { 0, new List<int> { 1, 2 } },
        { 1, new List<int> { 0, 3, 4 } },
        { 2, new List<int> { 0 } },
        { 3, new List<int> { 1 } },
        { 4, new List<int> { 1 } }
    };
    var result = Solution.BFS(graph, 0);
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}