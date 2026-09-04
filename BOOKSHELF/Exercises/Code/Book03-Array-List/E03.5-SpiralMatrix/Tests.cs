    /*
     * Test Case 1
     * Input:    { {1,2,3}, {4,5,6}, {7,8,9} }
     * Expected: { 1, 2, 3, 6, 9, 8, 7, 4, 5 }
     *
     * Test Case 2 - non square
     * Input:    { {1,2,3,4}, {5,6,7,8}, {9,10,11,12} }
     * Expected: { 1,2,3,4,8,12,11,10,9,5,6,7 }
     *
     * Test Case 3 - single row
     * Input:    { {1,2,3} }
     * Expected: { 1, 2, 3 }
     *
     * Test Case 4 - single column
     * Input:    { {1}, {2}, {3} }
     * Expected: { 1, 2, 3 }
     *
     * Test Case 5 - 1x1
     * Input:    { {7} }
     * Expected: { 7 }
     */
using Xunit;

public class SpiralMatrixTests
{
    [Theory]
    [MemberData(nameof(Cases))]
    public void SpiralOrder_ReturnsSpecifiedTraversal(int[][] matrix, int[] expected)
        => Assert.Equal(expected, Solution.SpiralOrder(matrix));

    public static IEnumerable<object[]> Cases =>
    [
        [new[] { new[] { 1, 2, 3 }, new[] { 4, 5, 6 }, new[] { 7, 8, 9 } }, new[] { 1, 2, 3, 6, 9, 8, 7, 4, 5 }],
        [new[] { new[] { 1, 2, 3, 4 }, new[] { 5, 6, 7, 8 }, new[] { 9, 10, 11, 12 } }, new[] { 1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7 }],
        [new[] { new[] { 1, 2, 3 } }, new[] { 1, 2, 3 }],
        [new[] { new[] { 1 }, new[] { 2 }, new[] { 3 } }, new[] { 1, 2, 3 }],
        [new[] { new[] { 7 } }, new[] { 7 }]
    ];
}
