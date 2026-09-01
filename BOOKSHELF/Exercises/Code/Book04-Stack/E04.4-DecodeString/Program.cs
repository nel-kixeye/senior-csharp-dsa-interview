try
{
    Console.WriteLine(Solution.DecodeString("3[a]2[bc]"));  // expect aaabcbc
    Console.WriteLine(Solution.DecodeString("3[a2[c]]"));   // expect accaccacc
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
