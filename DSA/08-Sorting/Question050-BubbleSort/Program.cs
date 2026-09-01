try
{
    var nums = new[] { 64, 34, 25, 12, 22, 11, 90 };
    Solution.BubbleSort(nums);
    Console.WriteLine(string.Join(", ", nums));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}