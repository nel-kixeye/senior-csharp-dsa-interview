try
{
    var graph = new Dictionary<int, List<int>>
    {
        { 0, new List<int> { 1, 2 } },
        { 1, new List<int> { 0, 3 } },
        { 2, new List<int> { 0, 4 } },
        { 3, new List<int> { 1 } },
        { 4, new List<int> { 2 } }
    };
    var result = Solution.BFSTraversal(graph, 0);
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}