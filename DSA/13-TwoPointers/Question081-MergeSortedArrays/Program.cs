try
{
    var result = Solution.MergeSortedArrays(new[] { 1, 3, 5 }, new[] { 2, 4, 6 });
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}