try
{
    Console.WriteLine(Solution.Encode("aaabbc"));            // expect a3b2c1
    Console.WriteLine(Solution.Decode("a3b2c1"));            // expect aaabbc
    Console.WriteLine(Solution.Encode(new string('a', 12))); // expect a12
    Console.WriteLine(Solution.Decode("a12"));               // expect 12 a's
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
