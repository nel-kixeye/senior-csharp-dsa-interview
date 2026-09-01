try
{
    Console.WriteLine(Solution.CheckInclusion("ab", "eidbaooo"));   // expect True  ("ba")
    Console.WriteLine(Solution.CheckInclusion("ab", "eidboaoo"));   // expect False
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
