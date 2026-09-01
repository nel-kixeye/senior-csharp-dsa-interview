try
{
    var c = new RecentCounter();
    Console.WriteLine(c.Ping(1));      // expect 1
    Console.WriteLine(c.Ping(100));    // expect 2
    Console.WriteLine(c.Ping(3001));   // expect 3
    Console.WriteLine(c.Ping(3002));   // expect 3  (the ping at t=1 has expired)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
