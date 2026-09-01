public static class Solution
{
    // =============================================
    // ATTEMPT 1 - INCORRECT
    // Issues:
    //   - basis started at 0, missing n from the expected sum
    //   - basis = 0+1+...+(n-1) but range is [0,n] so n was excluded
    // =============================================
    // var basis = 0;
    // for(var i = 0; i < nums.Length; i++)
    // {
    //     sum += nums[i];
    //     basis += i;
    // }
    // return basis - sum;

    // =============================================
    // CORRECT - ATTEMPT 2
    // PATTERN: Math / Gauss Sum
    // Expected sum of [0..n] = n + (0+1+2+...+(n-1))
    // Missing number = expectedSum - actualSum
    // =============================================
    public static int FindMissing(int[] nums)
    {
        var sum = 0;
        var basis = nums.Length;
        for (var i = 0; i < nums.Length; i++)
        {
            sum += nums[i];
            basis += i;
        }
        return basis - sum;
    }
}
