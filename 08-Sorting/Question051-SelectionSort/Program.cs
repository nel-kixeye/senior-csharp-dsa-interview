try
{
    var nums = new[] { 64, 25, 12, 22, 11 };
    Solution.SelectionSort(nums);
    Console.WriteLine(string.Join(", ", nums));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}