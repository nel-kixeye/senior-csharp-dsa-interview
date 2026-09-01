try
{
    var m = new TimeMap();
    m.Set("foo", "bar", 1);
    Console.WriteLine(m.Get("foo", 1));   // expect bar
    Console.WriteLine(m.Get("foo", 3));   // expect bar
    m.Set("foo", "bar2", 4);
    Console.WriteLine(m.Get("foo", 4));   // expect bar2
    Console.WriteLine(m.Get("foo", 5));   // expect bar2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
