try
{
    Console.WriteLine(Solution.WordBreak("leetcode", new List<string> { "leet", "code" }));
    Console.WriteLine(Solution.WordBreak("applepenapple", new List<string> { "apple", "pen" }));
    Console.WriteLine(Solution.WordBreak("catsandog", new List<string> { "cats", "dog", "sand", "and", "cat" }));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}