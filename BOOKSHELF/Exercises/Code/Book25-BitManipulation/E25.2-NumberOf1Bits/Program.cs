try
{
    Console.WriteLine(Solution.HammingWeight(11));           // expect 3   (1011)
    Console.WriteLine(Solution.HammingWeight(128));          // expect 1
    Console.WriteLine(Solution.HammingWeight(uint.MaxValue));// expect 32
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
