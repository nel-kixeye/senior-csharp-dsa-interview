    /*
     * Test Case 1
     * Input:    nums1 = { 1, 2, 3, 0, 0, 0 }, m = 3, nums2 = { 2, 5, 6 }, n = 3
     * Expected: { 1, 2, 2, 3, 5, 6 }
     *
     * Test Case 2 - nums2 empty
     * Input:    nums1 = { 1 }, m = 1, nums2 = { }, n = 0
     * Expected: { 1 }
     *
     * Test Case 3 - nums1 empty
     * Input:    nums1 = { 0 }, m = 0, nums2 = { 1 }, n = 1
     * Expected: { 1 }
     *
     * Test Case 4 - all of nums2 smaller
     * Input:    nums1 = { 4, 5, 0, 0 }, m = 2, nums2 = { 1, 2 }, n = 2
     * Expected: { 1, 2, 4, 5 }
     *
     * Test Case 5 - duplicates across both
     * Input:    nums1 = { 2, 2, 0, 0 }, m = 2, nums2 = { 2, 2 }, n = 2
     * Expected: { 2, 2, 2, 2 }
     */
using Xunit;

public class MergeSortedArrayTests
{
    [Theory]
    [MemberData(nameof(Cases))]
    public void Merge_UpdatesNums1(int[] nums1, int m, int[] nums2, int n, int[] expected)
    {
        Solution.Merge(nums1, m, nums2, n);
        Assert.Equal(expected, nums1);
    }

    public static IEnumerable<object[]> Cases =>
    [
        [new[] { 1, 2, 3, 0, 0, 0 }, 3, new[] { 2, 5, 6 }, 3, new[] { 1, 2, 2, 3, 5, 6 }],
        [new[] { 1 }, 1, Array.Empty<int>(), 0, new[] { 1 }],
        [new[] { 0 }, 0, new[] { 1 }, 1, new[] { 1 }],
        [new[] { 4, 5, 0, 0 }, 2, new[] { 1, 2 }, 2, new[] { 1, 2, 4, 5 }],
        [new[] { 2, 2, 0, 0 }, 2, new[] { 2, 2 }, 2, new[] { 2, 2, 2, 2 }]
    ];
}
