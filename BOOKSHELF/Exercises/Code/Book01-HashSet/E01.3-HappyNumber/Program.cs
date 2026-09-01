try
{
    Console.WriteLine(Solution.IsHappy(19));   // expect True  (1+81 -> 82 -> 68 -> 100 -> 1)
    Console.WriteLine(Solution.IsHappy(2));    // expect False (cycles)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
