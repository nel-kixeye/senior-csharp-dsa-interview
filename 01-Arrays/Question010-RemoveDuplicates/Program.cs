try
{
    var nums = new[] { 1, 1, 2 };
    int k = Solution.RemoveDuplicates(nums);
    Console.WriteLine($"k = {k}, array = [{string.Join(", ", nums[..k])}]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}