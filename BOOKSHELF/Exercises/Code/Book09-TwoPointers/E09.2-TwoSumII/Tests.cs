using Xunit;

public class TwoSumTests
{
    [Fact]
    public void ReturnsIndicesForExampleCase()
    {
        var actual = Solution.TwoSum(new[] { 2, 7, 11, 15 }, 9);

        Assert.Equal(new[] { 1, 2 }, actual);
    }

    [Fact]
    public void HandlesTwoElementArray()
    {
        var actual = Solution.TwoSum(new[] { -1, 0 }, -1);

        Assert.Equal(new[] { 1, 2 }, actual);
    }

    [Fact]
    public void HandlesNegativeValues()
    {
        var actual = Solution.TwoSum(new[] { -5, -2, 1, 4 }, -4);

        Assert.Equal(new[] { 1, 3 }, actual);
    }

    [Fact]
    public void FindsPairUsingFirstAndLastElements()
    {
        var actual = Solution.TwoSum(new[] { 1, 2, 3, 4, 9 }, 10);

        Assert.Equal(new[] { 1, 5 }, actual);
    }

    [Fact]
    public void ReturnsAnyValidPairWhenMultiplePairsExist()
    {
        var numbers = new[] { 1, 2, 3, 3, 4 };
        var actual = Solution.TwoSum(numbers, 6);

        Assert.Equal(2, actual.Length);
        Assert.InRange(actual[0], 1, numbers.Length);
        Assert.InRange(actual[1], 1, numbers.Length);
        Assert.True(actual[0] < actual[1]);
        Assert.Equal(6, numbers[actual[0] - 1] + numbers[actual[1] - 1]);
    }
}

