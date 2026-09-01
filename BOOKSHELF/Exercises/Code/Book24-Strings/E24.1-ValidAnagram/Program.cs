try
{
    Console.WriteLine(Solution.IsAnagram("anagram", "nagaram"));  // expect True
    Console.WriteLine(Solution.IsAnagram("rat", "car"));          // expect False
    Console.WriteLine(Solution.IsAnagram("aab", "abb"));          // expect False
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
