try
{
    Console.WriteLine(Solution.IsPalindrome("A man, a plan, a canal: Panama")); // expect True
    Console.WriteLine(Solution.IsPalindrome("race a car"));                     // expect False
    Console.WriteLine(Solution.IsPalindrome(" "));                              // expect True
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
