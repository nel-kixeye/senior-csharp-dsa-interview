try
{
    var nums1 = new[] { 1, 2, 3, 0, 0, 0 };
    var nums2 = new[] { 2, 5, 6 };
    Solution.Merge(nums1, 3, nums2, 3);
    Console.WriteLine(string.Join(", ", nums1));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}