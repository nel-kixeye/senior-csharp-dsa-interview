public static class Solution
{
    // Exist i, j with |i - j| <= indexDiff AND |nums[i] - nums[j]| <= valueDiff?
    // Target: O(n log k) time, O(k) space.
    // Two things maintained at once: a sliding window of the last k values,
    // AND the ability to ask that window a RANGE question.
    // WATCH: nums[i] - nums[j] can overflow int. Use long.
    public static bool ContainsNearbyAlmostDuplicate(int[] nums, int indexDiff, int valueDiff)
    {
        throw new NotImplementedException();
    }
}
