try
{
    Console.WriteLine($"[{Solution.LongestCommonPrefix(["flower", "flow", "flight"])}]"); // expect [fl]
    Console.WriteLine($"[{Solution.LongestCommonPrefix(["dog", "racecar", "car"])}]");    // expect []
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
