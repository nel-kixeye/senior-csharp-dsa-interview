try
{
    Console.WriteLine(string.Join(", ", Solution.MedianSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3)));
    // expect 1, -1, -1, 3, 5, 6
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
