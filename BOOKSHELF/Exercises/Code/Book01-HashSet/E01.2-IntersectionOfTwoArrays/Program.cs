try
{
    Console.WriteLine(string.Join(", ", Solution.Intersection([1, 2, 2, 1], [2, 2])));      // expect 2
    Console.WriteLine(string.Join(", ", Solution.Intersection([4, 9, 5], [9, 4, 9, 8, 4])));// expect 4, 9
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
