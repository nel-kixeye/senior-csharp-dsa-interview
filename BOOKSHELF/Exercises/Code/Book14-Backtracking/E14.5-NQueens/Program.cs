try
{
    var sols = Solution.SolveNQueens(4);
    Console.WriteLine($"n=4 solutions: {sols.Count}");   // expect 2
    foreach (var board in sols)
    {
        foreach (var row in board) Console.WriteLine(row);
        Console.WriteLine();
    }
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
