try
{
    Console.WriteLine(Solution.EvalRPN(new[] { "2", "1", "+", "3", "*" }));
    Console.WriteLine(Solution.EvalRPN(new[] { "4", "13", "5", "/", "+" }));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}