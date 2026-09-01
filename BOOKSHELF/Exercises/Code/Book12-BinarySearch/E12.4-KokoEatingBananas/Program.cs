try
{
    Console.WriteLine(Solution.MinEatingSpeed([3, 6, 7, 11], 8));           // expect 4
    Console.WriteLine(Solution.MinEatingSpeed([30, 11, 23, 4, 20], 5));     // expect 30
    Console.WriteLine(Solution.MinEatingSpeed([30, 11, 23, 4, 20], 6));     // expect 23
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
