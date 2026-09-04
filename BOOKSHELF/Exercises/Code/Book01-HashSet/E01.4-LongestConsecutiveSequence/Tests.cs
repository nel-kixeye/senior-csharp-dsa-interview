using Xunit;

public class LongestConsecutiveSequenceTests
{
    [Theory]
    [InlineData(new[] { 100, 4, 200, 1, 3, 2 }, 4)]
    [InlineData(new[] { 0, 3, 7, 2, 5, 8, 4, 6, 0, 1 }, 9)]
    [InlineData(new int[0], 0)]
    [InlineData(new[] { 1, 1, 1, 1 }, 1)]
    [InlineData(new[] { -3, -2, -1, 5 }, 3)]
    [InlineData(new[] { 42 }, 1)]
    public void LongestConsecutive_ReturnsSpecifiedLength(int[] nums, int expected)
        => Assert.Equal(expected, Solution.LongestConsecutive(nums));
}
