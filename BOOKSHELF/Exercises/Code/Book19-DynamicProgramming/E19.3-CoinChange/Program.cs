try
{
    Console.WriteLine(Solution.CoinChange([1, 3, 4], 6));    // expect 2  (3+3, NOT greedy's 3)
    Console.WriteLine(Solution.CoinChange([1, 2, 5], 11));   // expect 3
    Console.WriteLine(Solution.CoinChange([2], 3));          // expect -1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
