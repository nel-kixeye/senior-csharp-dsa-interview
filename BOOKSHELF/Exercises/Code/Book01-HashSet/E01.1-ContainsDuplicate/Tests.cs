using Xunit;

public class ContainsDuplicateTests
{
    [Theory]
    [InlineData(new[] { 1, 2, 3, 1 }, true)]
    [InlineData(new[] { 1, 2, 3, 4 }, false)]
    [InlineData(new int[0], false)]
    [InlineData(new[] { 7 }, false)]
    [InlineData(new[] { 5, 5, 5, 5 }, true)]
    [InlineData(new[] { -1, -2, -1 }, true)]
    public void ContainsDuplicate_ReturnsSpecifiedResult(int[] nums, bool expected)
        => Assert.Equal(expected, Solution.ContainsDuplicate(nums));
}
