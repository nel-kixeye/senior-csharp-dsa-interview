using Xunit;

public class TwoSumTests
{
    [Theory]
    [InlineData(new[] { 2, 7, 11, 15 }, 9, new[] { 0, 1 })]
    [InlineData(new[] { 3, 3 }, 6, new[] { 0, 1 })]
    [InlineData(new[] { 3, 2, 4 }, 6, new[] { 1, 2 })]
    [InlineData(new[] { -3, 4, 3, 90 }, 0, new[] { 0, 2 })]
    public void TwoSum_ReturnsSpecifiedIndices(int[] nums, int target, int[] expected)
        => Assert.Equal(expected, Solution.TwoSum(nums, target));

    [Fact]
    public void TwoSum_DoesNotReuseTheSameElement()
    {
        var nums = new[] { 3, 2, 4 };
        var result = Solution.TwoSum(nums, 6);
        Assert.Equal(2, result.Length);
        Assert.NotEqual(result[0], result[1]);
        Assert.Equal(6, nums[result[0]] + nums[result[1]]);
    }
}
