try
{
    var nums = new[] { 12, 11, 13, 5, 6 };
    Solution.InsertionSort(nums);
    Console.WriteLine(string.Join(", ", nums));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}