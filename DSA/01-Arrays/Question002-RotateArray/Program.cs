try
{
    var nums = new[] { 1, 2, 3, 4, 5, 6, 7 };
    Solution.Rotate(nums, 3);
    Console.WriteLine(string.Join(", ", nums));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}