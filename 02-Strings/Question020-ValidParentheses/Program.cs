try
{
    Console.WriteLine(Solution.IsValid("()"));
    Console.WriteLine(Solution.IsValid("()[]{}"));
    Console.WriteLine(Solution.IsValid("(]"));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}