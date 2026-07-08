public static class Solution
{
    // =============================================
    // ATTEMPT 1 - INCORRECT
    // Issues:
    //   - Single pointer i, indices derived as i-m and i-n (wrong offsets)
    //   - Never compared nums1 real elements against nums2 properly
    //   - IndexOutOfRangeException when i < m (i-m goes negative)
    // =============================================

    // =============================================
    // ATTEMPT 2 - INCORRECT
    // Issues:
    //   - Still single pointer, i-m and i-n still drift wrong
    //   - Condition (i-m)>0 || (i-n)>0 doesn't guard correctly
    //   - No 3 independent pointer variables
    // =============================================

    // =============================================
    // CORRECT - REVEALED AT ATTEMPT 3
    // PATTERN: Two-Pointer Merge from the Back
    // Both input arrays are ALREADY sorted — no sorting needed
    // Fill from the back to avoid overwriting unplaced elements
    // Loop ends when nums2 exhausted — remaining nums1 elements are already in place
    // =============================================
    public static void Merge(int[] nums1, int m, int[] nums2, int n)
    {
        int p1 = m - 1;
        int p2 = n - 1;
        int p  = m + n - 1;

        while (p2 >= 0)
        {
            if (p1 >= 0 && nums1[p1] > nums2[p2])
            {
                nums1[p] = nums1[p1];
                p1--;
            }
            else
            {
                nums1[p] = nums2[p2];
                p2--;
            }
            p--;
        }
    }
}
