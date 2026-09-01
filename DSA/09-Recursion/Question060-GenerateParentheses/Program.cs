try
{
    var result = Solution.GenerateParenthesis(3);
    foreach (var s in result)
        Console.WriteLine(s);
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}