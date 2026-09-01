try
{
    Console.WriteLine(Solution.CountPrimes(10));      // expect 4  (2,3,5,7)
    Console.WriteLine(Solution.CountPrimes(0));       // expect 0
    Console.WriteLine(Solution.CountPrimes(1000000)); // expect 78498
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
