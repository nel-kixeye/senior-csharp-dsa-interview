try
{
    var nums = new[] { 0, 0, 1, 1, 1, 2, 2, 3, 3, 4 };
    int k = Solution.RemoveDuplicates(nums);
    Console.WriteLine($"k={k}, first {k}: [{string.Join(", ", nums[..k])}]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}