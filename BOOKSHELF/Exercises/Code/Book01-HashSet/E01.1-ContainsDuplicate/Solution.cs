public static class Solution
{
    // Target: O(n) time, O(n) space.
    // Naive to avoid: nested loops, or List.Contains inside a loop.
    public static bool ContainsDuplicate(int[] nums)
    {
        var seen = new HashSet<int>();
        foreach(var num in nums)
        {
            if(!seen.Add(num))
            {
                return true;
            }
        }
        return false;
    }
}
