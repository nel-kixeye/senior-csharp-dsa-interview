try
{
    var result = Solution.GroupAnagrams(new[] { "eat", "tea", "tan", "ate", "nat", "bat" });
    foreach (var group in result)
        Console.WriteLine(string.Join(", ", group));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}