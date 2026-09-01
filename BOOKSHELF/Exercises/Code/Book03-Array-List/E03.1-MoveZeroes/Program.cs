try
{
    var a = new[] { 0, 1, 0, 3, 12 };
    Solution.MoveZeroes(a);
    Console.WriteLine(string.Join(", ", a));   // expect 1, 3, 12, 0, 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
