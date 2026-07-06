try
{
    var nums = new[] { 10, 7, 8, 9, 1, 5 };
    Solution.QuickSort(nums, 0, nums.Length - 1);
    Console.WriteLine(string.Join(", ", nums));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}