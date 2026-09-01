public static class Solution
{
    // =============================================
    // ATTEMPT 1 - INCORRECT
    // Issues:
    //   - Swapping in-loop overwrites elements before they are moved
    //   - k not normalized
    // =============================================
    // for(var i = 0; i < nums.Length; i++)
    // {
    //     var temp = nums[(k + i) % nums.Length];
    //     nums[(k + i) % nums.Length] = nums[i];
    //     nums[i] = temp;
    // }

    // =============================================
    // ATTEMPT 2 - INCORRECT
    // Issues:
    //   - Mixed temp array fill + in-place swap at the same time
    //   - Operator precedence bug: k+i % n != (k+i) % n
    //   - k not normalized
    // =============================================
    // var temp = new int[nums.Length];
    // for(var i = 0; i < nums.Length; i++)
    // {
    //     temp[k+i % nums.Length] = nums[i];
    //     nums[i] = nums[k+i % nums.Length];
    //     nums[k+i % nums.Length] = temp[k+i % nums.Length];
    // }

    // =============================================
    // KEY INSIGHT:
    //   - If O(n) space is allowed  -> use temp array + copy back
    //   - If O(1) space is required -> use Reversal Algorithm (3 reverses)
    // =============================================

    // O(n) space approach - simpler, use when space is not restricted
    public static void RotateWithExtraSpace(int[] nums, int k)
    {
        k %= nums.Length;
        int[] temp = new int[nums.Length];

        for (int i = 0; i < nums.Length; i++)
            temp[(i + k) % nums.Length] = nums[i];

        for (int i = 0; i < nums.Length; i++)
            nums[i] = temp[i];
    }

    // O(1) space approach - PATTERN: Reversal Algorithm
    // 1. Normalize k
    // 2. Reverse all
    // 3. Reverse first k
    // 4. Reverse remaining
    public static void Rotate(int[] nums, int k)
    {
        k %= nums.Length;
        Reverse(nums, 0, nums.Length - 1);
        Reverse(nums, 0, k - 1);
        Reverse(nums, k, nums.Length - 1);
    }

    private static void Reverse(int[] nums, int left, int right)
    {
        while (left < right)
        {
            (nums[left], nums[right]) = (nums[right], nums[left]);
            left++;
            right--;
        }
    }
}
