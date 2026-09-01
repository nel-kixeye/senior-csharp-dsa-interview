try
{
    foreach (var iv in Solution.Insert([[1, 3], [6, 9]], [2, 5]))
        Console.Write($"[{iv[0]},{iv[1]}] ");
    Console.WriteLine();
    // expect [1,5] [6,9]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
