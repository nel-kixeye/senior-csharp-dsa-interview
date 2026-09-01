try
{
    Console.WriteLine(Solution.TitleToNumber("A"));        // expect 1
    Console.WriteLine(Solution.TitleToNumber("AB"));       // expect 28
    Console.WriteLine(Solution.TitleToNumber("ZY"));       // expect 701
    Console.WriteLine(Solution.ConvertToTitle(28));        // expect AB
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
