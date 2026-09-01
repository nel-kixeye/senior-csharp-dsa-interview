try
{
    Console.WriteLine(Solution.LengthOfLongestSubstring("abcabcbb"));  // expect 3
    Console.WriteLine(Solution.LengthOfLongestSubstring("bbbbb"));     // expect 1
    Console.WriteLine(Solution.LengthOfLongestSubstring("pwwkew"));    // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
