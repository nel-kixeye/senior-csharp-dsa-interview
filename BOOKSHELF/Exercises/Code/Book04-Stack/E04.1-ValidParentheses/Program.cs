try
{
    Console.WriteLine(Solution.IsValid("()[]{}"));  // expect True
    Console.WriteLine(Solution.IsValid("([)]"));    // expect False
    Console.WriteLine(Solution.IsValid("((("));     // expect False
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
