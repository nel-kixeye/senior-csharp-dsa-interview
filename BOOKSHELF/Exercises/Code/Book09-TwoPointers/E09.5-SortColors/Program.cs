try
{
    var a = new[] { 2, 0, 2, 1, 1, 0 };
    Solution.SortColors(a);
    Console.WriteLine(string.Join(", ", a));   // expect 0, 0, 1, 1, 2, 2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
