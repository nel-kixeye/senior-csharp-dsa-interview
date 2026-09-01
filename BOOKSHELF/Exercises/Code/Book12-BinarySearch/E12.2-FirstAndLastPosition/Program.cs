try
{
    Console.WriteLine(string.Join(", ", Solution.SearchRange([5, 7, 7, 8, 8, 10], 8)));  // expect 3, 4
    Console.WriteLine(string.Join(", ", Solution.SearchRange([5, 7, 7, 8, 8, 10], 6)));  // expect -1, -1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
