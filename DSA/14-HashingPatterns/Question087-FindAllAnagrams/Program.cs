try
{
    var result = Solution.FindAnagrams("cbaebabacd", "abc");
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}