try
{
    foreach (var p in Solution.KClosest([[1, 3], [-2, 2]], 1))
        Console.WriteLine($"[{p[0]}, {p[1]}]");        // expect [-2, 2]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
