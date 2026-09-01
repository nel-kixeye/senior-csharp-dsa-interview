try
{
    Console.WriteLine(Solution.CountAsync("hello".AsMemory()).Result);  // expect 5
    Console.WriteLine(new string(Solution.Build()).TrimEnd('\0'));      // expect x
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
