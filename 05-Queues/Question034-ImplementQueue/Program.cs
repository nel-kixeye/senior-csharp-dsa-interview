try
{
    var q = new MyQueue();
    q.Push(1);
    q.Push(2);
    Console.WriteLine(q.Peek());
    Console.WriteLine(q.Pop());
    Console.WriteLine(q.Empty());
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}