public static class Solution
{
    // =============================================
    // ATTEMPT 1 - INCORRECT
    // Issues:
    //   - marker = i in else branch causes marker to skip positions
    //   - non-zero copy without swap left duplicates
    // =============================================
    // if(nums[i] != 0) { nums[marker] = nums[i]; marker++; }
    // else { marker = i; }

    // =============================================
    // ATTEMPT 2 - INCORRECT
    // Issues:
    //   - marker = i in else branch still present, skips zero positions
    //   - swap was right idea but marker jumping caused zeros to be missed
    // =============================================
    // if(nums[i] != 0) { swap(marker, i); marker++; }
    // else { marker = i; }

    // =============================================
    // CORRECT - ATTEMPT 3
    // PATTERN: Write Pointer
    // marker = next slot for a non-zero value
    // swap non-zero to marker position, advance marker
    // zeros naturally fall behind — no second pass needed
    // =============================================
    public static void MoveZeroes(int[] nums)
    {
        var marker = 0;
        for (var i = 0; i < nums.Length; i++)
        {
            if (nums[i] != 0)
            {
                (nums[marker], nums[i]) = (nums[i], nums[marker]);
                marker++;
            }
        }
    }
}
