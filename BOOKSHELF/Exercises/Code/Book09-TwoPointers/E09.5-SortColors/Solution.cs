public static class Solution
{
    // Array contains only 0, 1, 2. Sort IN PLACE, ONE PASS, O(1) space.
    // Counting sort does it in two passes - the one-pass version needs THREE
    // pointers. Name each one's job.
    // Critical: in exactly one case the scanning index must NOT advance. Which,
    // and why?
    public static void SortColors(int[] nums)
    {
        var low = 0;
        var mid = 0;
        var high = nums.Length - 1;

        while(mid <= high)
        {
            if(nums[mid] == 0)
            {
                (nums[low], nums[mid]) = (nums[mid], nums[low]);
                low++;
                mid++;
            }
            else if(nums[mid] == 1)
            {
                mid++;
            }
            else
            {
                (nums[mid], nums[high]) = (nums[high], nums[mid]);
                high--;
            }
        }
    }
}
