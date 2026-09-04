using Xunit;

public class TopKFrequentElementsTests
{
    [Theory]
    [InlineData(new[] { 1, 1, 1, 2, 2, 3 }, 2, new[] { 1, 2 })]
    [InlineData(new[] { 1 }, 1, new[] { 1 })]
    [InlineData(new[] { 1, 2, 3 }, 3, new[] { 1, 2, 3 })]
    [InlineData(new[] { 5, 5, 5 }, 1, new[] { 5 })]
    public void TopKFrequent_ReturnsSpecifiedValues(int[] nums, int k, int[] expected)
        => Assert.Equal(expected.OrderBy(value => value), Solution.TopKFrequent(nums, k).OrderBy(value => value));

    [Fact]
    public void TopKFrequent_AllowsEitherValueForAFrequencyTie()
        => Assert.Contains(Solution.TopKFrequent(new[] { 1, 2 }, 1), value => value is 1 or 2);
}
