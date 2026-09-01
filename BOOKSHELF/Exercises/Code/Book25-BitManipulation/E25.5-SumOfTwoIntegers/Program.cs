try
{
    Console.WriteLine(Solution.GetSum(1, 2));     // expect 3
    Console.WriteLine(Solution.GetSum(2, 3));     // expect 5
    Console.WriteLine(Solution.GetSum(-2, 3));    // expect 1
    Console.WriteLine(Solution.GetSum(-1, -1));   // expect -2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
