try
{
    var cq = new CircularQueue(3);
    Console.WriteLine(cq.Enqueue(1));
    Console.WriteLine(cq.Enqueue(2));
    Console.WriteLine(cq.Enqueue(3));
    Console.WriteLine(cq.Enqueue(4));
    Console.WriteLine(cq.Rear());
    Console.WriteLine(cq.IsFull());
    Console.WriteLine(cq.Dequeue());
    Console.WriteLine(cq.Enqueue(4));
    Console.WriteLine(cq.Rear());
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}