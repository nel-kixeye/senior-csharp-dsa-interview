try
{
    var a = new[] { 1, 2, 3, 4, 5, 6, 7 };
    Solution.Rotate(a, 3);
    Console.WriteLine(string.Join(", ", a));   // expect 5, 6, 7, 1, 2, 3, 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
