try
{
    Console.WriteLine(Solution.MyPow(2.0, 10));    // expect 1024
    Console.WriteLine(Solution.MyPow(2.0, -2));    // expect 0.25
    Console.WriteLine(Solution.MyPow(2.0, 0));     // expect 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
