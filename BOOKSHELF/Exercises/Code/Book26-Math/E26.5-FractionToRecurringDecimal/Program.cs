try
{
    Console.WriteLine(Solution.FractionToDecimal(1, 2));    // expect 0.5
    Console.WriteLine(Solution.FractionToDecimal(2, 3));    // expect 0.(6)
    Console.WriteLine(Solution.FractionToDecimal(4, 333));  // expect 0.(012)
    Console.WriteLine(Solution.FractionToDecimal(-50, 8));  // expect -6.25
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
