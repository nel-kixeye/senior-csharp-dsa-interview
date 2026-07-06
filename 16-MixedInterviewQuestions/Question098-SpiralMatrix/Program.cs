try
{
    var matrix = new[] { new[]{1,2,3}, new[]{4,5,6}, new[]{7,8,9} };
    var result = Solution.SpiralOrder(matrix);
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}