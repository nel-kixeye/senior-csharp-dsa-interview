try
{
    Console.WriteLine(Solution.IsAnagram("anagram", "nagaram"));  // expect True
    Console.WriteLine(Solution.IsAnagram("rat", "car"));          // expect False
    Console.WriteLine(Solution.CountDistinct("hello", 128));      // expect 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
