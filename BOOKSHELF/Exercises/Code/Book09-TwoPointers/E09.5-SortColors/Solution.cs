public static class Solution
{
    // Array contains only 0, 1, 2. Sort IN PLACE, ONE PASS, O(1) space.
    // Counting sort does it in two passes - the one-pass version needs THREE
    // pointers. Name each one's job.
    // Critical: in exactly one case the scanning index must NOT advance. Which,
    // and why?
    public static void SortColors(int[] nums)
    {
        var zero = 0;
        var ones = 0;
        var twos = nums.Length - 1;

        while(ones <= twos)
        {
            if(nums[ones] == 0)
            {
                (nums[zero], nums[ones]) = (nums[ones], nums[zero]);
                zero++;
                ones++;
            }
            else if(nums[ones] == 1)
            {
                ones++;
            }
            else
            {
                (nums[ones], nums[twos]) = (nums[twos], nums[ones]);
                twos--;
            }
        }
    }
}
