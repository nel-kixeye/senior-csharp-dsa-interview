public static class Solution
{
    // =============================================
    // ATTEMPT 1 - INCORRECT
    // Issues:
    //   - temp array hardcoded to 5 elements (breaks for other sizes)
    //   - capacity never decrements inside loop
    //   - always overwrites temp[0] (same index every iteration)
    //   - uses extra array -> violates O(1) space constraint
    // =============================================
    // int[] temp = [0,0,0,0,0];
    // var capacity = nums.Length - 1;
    // for(var i = 0; i < nums.Length; i++)
    // {
    //     temp[0] = nums[capacity];
    // }
    // return temp;

    public static int[] Reverse(int[] nums)
    {
        int left = 0;
        int right = nums.Length - 1;

        while (left < right)
        {
            (nums[left], nums[right]) = (nums[right], nums[left]);
            left++;
            right--;
        }

        return nums;
    }
}
