using Xunit;

public class FindMaxAverageTests
{
    [Theory]
    [InlineData(new[] { 1, 12, -5, -6, 50, 3 }, 4, 12.75)]
    [InlineData(new[] { 1, 2, 3, 4 }, 4, 2.5)]
    [InlineData(new[] { -1, -5, 3 }, 1, 3.0)]
    [InlineData(new[] { -5, -2, -10 }, 2, -3.5)]
    [InlineData(new[] { 5 }, 1, 5.0)]
    [InlineData(new[] { 1, 2, 4 }, 3, 2.3333333333333335)]
    public void FindMaxAverage_ReturnsExpectedAverage(int[] nums, int k, double expected)
    {
        var actual = Solution.FindMaxAverage(nums, k);

        Assert.Equal(expected, actual, precision: 10);
    }
}

