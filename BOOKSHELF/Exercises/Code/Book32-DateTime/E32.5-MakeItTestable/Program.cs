var sub = new Subscription(1, new DateTimeOffset(2026, 9, 1, 12, 0, 0, TimeSpan.Zero));

try
{
    // Now you can test the boundary EXACTLY, with no waiting and no flakiness.
    Console.WriteLine(Solution.IsExpired(sub, new DateTimeOffset(2026, 9, 1, 11, 59, 59, TimeSpan.Zero))); // False
    Console.WriteLine(Solution.IsExpired(sub, new DateTimeOffset(2026, 9, 1, 12, 0, 0,  TimeSpan.Zero))); // False (not >)
    Console.WriteLine(Solution.IsExpired(sub, new DateTimeOffset(2026, 9, 1, 12, 0, 1,  TimeSpan.Zero))); // True
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
