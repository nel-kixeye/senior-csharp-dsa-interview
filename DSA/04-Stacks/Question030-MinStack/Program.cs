try
{
    var stack = new MinStack();
    stack.Push(-2);
    stack.Push(0);
    stack.Push(-3);
    Console.WriteLine(stack.GetMin());
    stack.Pop();
    Console.WriteLine(stack.Top());
    Console.WriteLine(stack.GetMin());
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}