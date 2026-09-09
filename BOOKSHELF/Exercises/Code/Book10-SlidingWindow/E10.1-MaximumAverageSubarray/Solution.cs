public static class Solution
{
    // Contiguous subarray of EXACTLY length k with the maximum average.
    // Target: O(n) time, O(1) space.
    // One element enters and one leaves per step. Write those two lines first.
    // Track the SUM and divide once at the end - dividing per window loses
    // precision and time.
    public static double FindMaxAverage(int[] nums, int k)
    {
        var sum = 0.0;
        var best = double.MinValue;
        for(var i = 0; i < nums.Length; i++)
        {
            sum += nums[i];
            if(i >= k) sum -= nums[i - k];
            if(i >= k - 1) best = Math.Max(best, sum / k);
        }
        return best;
    }
}
