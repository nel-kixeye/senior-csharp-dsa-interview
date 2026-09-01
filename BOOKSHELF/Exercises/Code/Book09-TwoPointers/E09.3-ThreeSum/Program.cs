try
{
    foreach (var t in Solution.ThreeSum([-1, 0, 1, 2, -1, -4]))
        Console.WriteLine($"[{string.Join(", ", t)}]");
    // expect [-1, -1, 2] and [-1, 0, 1]  -- exactly two triplets, no duplicates
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
