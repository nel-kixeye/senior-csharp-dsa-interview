try
{
    int[][] a = [[0, 2], [5, 10], [13, 23], [24, 25]];
    int[][] b = [[1, 5], [8, 12], [15, 24], [25, 26]];
    foreach (var iv in Solution.IntervalIntersection(a, b))
        Console.Write($"[{iv[0]},{iv[1]}] ");
    Console.WriteLine();
    // expect [1,2] [5,5] [8,10] [15,23] [24,24] [25,25]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
