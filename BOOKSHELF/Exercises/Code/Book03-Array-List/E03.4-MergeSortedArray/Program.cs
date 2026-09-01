try
{
    var a = new[] { 1, 2, 3, 0, 0, 0 };
    Solution.Merge(a, 3, [2, 5, 6], 3);
    Console.WriteLine(string.Join(", ", a));   // expect 1, 2, 2, 3, 5, 6
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
