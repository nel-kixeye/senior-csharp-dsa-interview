try
{
    Console.WriteLine(Solution.LadderLength("hit", "cog",
        ["hot", "dot", "dog", "lot", "log", "cog"]));   // expect 5

    Console.WriteLine(Solution.LadderLength("hit", "cog",
        ["hot", "dot", "dog", "lot", "log"]));          // expect 0 (cog not in list)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
