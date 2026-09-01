try
{
    var nums = new[] { 0, 1, 0, 3, 12 };
    Solution.MoveZeroes(nums);
    Console.WriteLine(string.Join(", ", nums));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}