public static class Solution
{
    // Split nums into k non-empty CONTIGUOUS subarrays so as to MINIMIZE the
    // largest subarray sum. Return that minimized largest sum.
    //
    // "Minimize the maximum" should trigger this book instantly.
    // Feasibility check: given a candidate largest-sum X, greedily cut a new
    // piece whenever adding the next element would exceed X. Feasible iff
    // pieces <= k.
    // Bounds: lo = max element, hi = total sum. Say why each is correct.
    public static int SplitArray(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
