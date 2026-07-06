try
{
    var nums = new[] { 38, 27, 43, 3, 9, 82, 10 };
    var result = Solution.MergeSort(nums);
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}