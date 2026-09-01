Console.WriteLine(Math.Round(2.5));                                   // ?
Console.WriteLine(Math.Round(3.5));                                   // ?
Console.WriteLine(Math.Round(2.5, MidpointRounding.AwayFromZero));    // ?
Console.WriteLine(Math.Round(2.675, 2));                              // ?
Console.WriteLine((int)2.7);                                          // ?
Console.WriteLine(Math.Floor(-2.1));                                  // ?
Console.WriteLine((int)(-2.7));                                       // ?

try
{
    Console.WriteLine(Solution.RoundMoney(2.675m));   // expect 2.68
    Console.WriteLine(Solution.RoundMoney(2.5m));     // expect 2.5 -> depends on your rule
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
