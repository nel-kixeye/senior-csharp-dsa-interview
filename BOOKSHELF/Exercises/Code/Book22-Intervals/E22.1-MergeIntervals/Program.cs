try
{
    foreach (var iv in Solution.Merge([[1, 3], [2, 6], [8, 10], [15, 18]]))
        Console.Write($"[{iv[0]},{iv[1]}] ");
    Console.WriteLine();
    // expect [1,6] [8,10] [15,18]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
