try
{
    Console.WriteLine(Solution.MinWindow("ADOBECODEBANC", "ABC"));  // expect BANC
    Console.WriteLine($"[{Solution.MinWindow("a", "aa")}]");        // expect []
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
