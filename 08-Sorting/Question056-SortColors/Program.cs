try
{
    var nums = new[] { 2, 0, 2, 1, 1, 0 };
    Solution.SortColors(nums);
    Console.WriteLine(string.Join(", ", nums));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}