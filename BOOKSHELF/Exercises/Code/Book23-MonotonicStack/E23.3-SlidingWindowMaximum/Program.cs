try
{
    Console.WriteLine(string.Join(", ", Solution.MaxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3)));
    // expect 3, 3, 5, 5, 6, 7
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
