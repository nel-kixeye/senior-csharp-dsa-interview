int[][] mat = [[0, 0, 0], [0, 1, 0], [1, 1, 1]];

try
{
    foreach (var row in Solution.UpdateMatrix(mat))
        Console.WriteLine(string.Join(" ", row));
    // expect
    // 0 0 0
    // 0 1 0
    // 1 2 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
