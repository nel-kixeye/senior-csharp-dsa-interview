try
{
    Console.WriteLine(string.Join(", ", Solution.ProductExceptSelf([1, 2, 3, 4])));   // expect 24, 12, 8, 6
    Console.WriteLine(string.Join(", ", Solution.ProductExceptSelf([-1, 1, 0, -3, 3])));// expect 0, 0, 9, 0, 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
