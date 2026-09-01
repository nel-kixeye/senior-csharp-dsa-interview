public static class Solution
{
    // Target: O(n) time, O(n) space.
    // Naive to avoid: nested loops, or List.Contains inside a loop.
    public static bool ContainsDuplicate(int[] nums)
    {
        var seenChecker = new HashSet<int>();
        foreach(var num in nums)
        {
            if(!seenChecker.Add(num))
                return true;
        }
        return false;
    }
}
