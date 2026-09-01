try
{
    Console.WriteLine(Solution.RemoveKdigits("1432219", 3));  // expect 1219
    Console.WriteLine(Solution.RemoveKdigits("10200", 1));    // expect 200
    Console.WriteLine(Solution.RemoveKdigits("10", 2));       // expect 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
