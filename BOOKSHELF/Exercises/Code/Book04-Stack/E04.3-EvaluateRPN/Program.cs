try
{
    Console.WriteLine(Solution.EvalRPN(["2", "1", "+", "3", "*"]));   // expect 9
    Console.WriteLine(Solution.EvalRPN(["4", "13", "5", "/", "+"]));  // expect 6
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
