try
{
    Console.WriteLine(Solution.MyAtoi("42"));            // expect 42
    Console.WriteLine(Solution.MyAtoi("   -042"));       // expect -42
    Console.WriteLine(Solution.MyAtoi("1337c0d3"));      // expect 1337
    Console.WriteLine(Solution.MyAtoi("words and 987")); // expect 0
    Console.WriteLine(Solution.MyAtoi("-91283472332"));  // expect -2147483648
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
