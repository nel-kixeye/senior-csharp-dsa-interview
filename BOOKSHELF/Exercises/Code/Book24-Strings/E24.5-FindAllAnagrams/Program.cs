try
{
    Console.WriteLine(string.Join(", ", Solution.FindAnagrams("cbaebabacd", "abc")));  // expect 0, 6
    Console.WriteLine(string.Join(", ", Solution.FindAnagrams("abab", "ab")));         // expect 0, 1, 2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
