try
{
    Console.WriteLine(Solution.CoinChange(new[] { 1, 5, 11 }, 15));
    Console.WriteLine(Solution.CoinChange(new[] { 2 }, 3));
    Console.WriteLine(Solution.CoinChange(new[] { 1, 2, 5 }, 11));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}