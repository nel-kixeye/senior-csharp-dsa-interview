try
{
    Console.WriteLine(Solution.FindMaxLength([0, 1]));            // expect 2
    Console.WriteLine(Solution.FindMaxLength([0, 1, 0]));         // expect 2
    Console.WriteLine(Solution.FindMaxLength([0, 0, 1, 0, 0, 0, 1, 1])); // expect 6
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
