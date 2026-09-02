public static class Solution
{
    // Input is SORTED and 1-INDEXED. Return the two 1-based indices.
    // O(1) EXTRA SPACE required - that rules out the Dictionary approach.
    // When the sum is too small, which pointer moves, and WHY is it safe to
    // discard everything it skipped?
    public static int[] TwoSum(int[] numbers, int target)
    {
        var left = 0;
        var right = numbers.Length - 1;

        while(left < right)
        {
            var sum = numbers[left] + numbers[right];
            if(sum < target)
            {
                left++;
                continue;
            }
            if(sum > target)
            {
                right--;
                continue;
            }
            if(sum == target)
                break;
            
        }
        return [left + 1,right + 1];
    }
}
