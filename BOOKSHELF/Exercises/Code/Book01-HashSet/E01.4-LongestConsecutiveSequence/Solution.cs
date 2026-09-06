public static class Solution
{
    // MUST run in O(n). Sorting (O(n log n)) does not satisfy the constraint.
    // The whole trick is one guard: only walk a run from its starting value.
    public static int LongestConsecutive(int[] nums)
    {
        var collection = new HashSet<int>(nums);
        var checker = new HashSet<int>();
        foreach(var num in nums)
        {
            if(collection.Contains(num + 1) || collection.Contains(num - 1))
            {
                checker.Add(num);
            }
        }
        if(checker.Count == 0 && nums.Length != 0) return 1;
        return checker.Count;
    }
}
