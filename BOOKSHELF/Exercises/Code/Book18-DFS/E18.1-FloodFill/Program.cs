int[][] image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]];

try
{
    foreach (var row in Solution.FloodFill(image, 1, 1, 2))
        Console.WriteLine(string.Join(" ", row));
    // expect
    // 2 2 2
    // 2 2 0
    // 2 0 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
