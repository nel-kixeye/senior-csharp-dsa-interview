public static class Solution
{
    // All UNIQUE triplets summing to zero.
    // Target: O(n^2) time, O(1) extra space beyond the output.
    // Sorting does TWO jobs here. Name both.
    // (Most people name only the first, then produce duplicate triplets.)

    // =============================================
    // MY FINAL ATTEMPT - INCORRECT (revealed at attempt 7)
    // The algorithm was RIGHT. Every triplet it produced was correct.
    // What was missing: de-duplication, in BOTH places.
    //   - no SITE A skip: equal fixed values re-ran the identical scan
    //     [-4,-1,-1,0,1,2] found [-1,0,1] twice, once per '-1'
    //   - no SITE B skip: after a match, stepping one position inward
    //     could land on equal values and re-record the same triplet
    //     [-2,0,0,2,2] found [-2,0,2] twice from a single fixed element
    // =============================================
    // for(var target = 0; target < nums.Length - 2; target++)
    // {
    //     var lo = target + 1;
    //     var hi = nums.Length - 1;
    //     while(lo < hi)
    //     {
    //         if(nums[lo] + nums[hi] < -nums[target])
    //             lo++;
    //         else if(nums[lo] + nums[hi] > -nums[target])
    //             hi--;
    //         else
    //         {
    //             collection.Add([nums[lo], nums[hi], nums[target]]);
    //             lo++;
    //             hi--;
    //         }
    //     }
    // }

    public static IList<IList<int>> ThreeSum(int[] nums)
    {
        Array.Sort(nums);

        // IList<int> as the element type - avoids the generic-invariance
        // conversion at the return (List<List<int>> is NOT IList<IList<int>>).
        var result = new List<IList<int>>();

        for (int i = 0; i < nums.Length - 2; i++)
        {
            // SITE A - this fixed value was already fully explored by the
            // previous iteration. Re-running the scan can only reproduce it.
            if (i > 0 && nums[i] == nums[i - 1]) continue;

            int lo = i + 1, hi = nums.Length - 1;

            while (lo < hi)
            {
                // Folding the fixed element into the sum and comparing to 0
                // keeps the direction logic identical to E09.2. Comparing
                // nums[lo] + nums[hi] against -nums[i] is equivalent but the
                // moving target is what made me invert the directions earlier.
                int sum = nums[i] + nums[lo] + nums[hi];

                if (sum < 0)
                    lo++;               // too small: lo is provably dead (E09.2 argument)
                else if (sum > 0)
                    hi--;               // too big: hi is provably dead
                else
                {
                    result.Add(new List<int> { nums[i], nums[lo], nums[hi] });
                    lo++;
                    hi--;

                    // SITE B - advance FIRST, then compare against the value
                    // just consumed. Comparing before advancing is off by one.
                    while (lo < hi && nums[lo] == nums[lo - 1]) lo++;
                    while (lo < hi && nums[hi] == nums[hi + 1]) hi--;
                }
            }
        }

        return result;
    }
}
