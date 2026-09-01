try
{
    var groups = Solution.GroupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]);
    foreach (var g in groups)
        Console.WriteLine($"[{string.Join(", ", g)}]");
    // expect 3 groups: [eat, tea, ate] [tan, nat] [bat]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
