try
{
    var c = new LRUCache(2);
    c.Put(1, 1);
    c.Put(2, 2);
    Console.WriteLine(c.Get(1));   // expect 1   (1 becomes most recent)
    c.Put(3, 3);                   // evicts key 2
    Console.WriteLine(c.Get(2));   // expect -1
    c.Put(4, 4);                   // evicts key 1
    Console.WriteLine(c.Get(1));   // expect -1
    Console.WriteLine(c.Get(3));   // expect 3
    Console.WriteLine(c.Get(4));   // expect 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
