using Xunit;

public class HappyNumberTests
{
    [Theory]
    [InlineData(19, true)]
    [InlineData(2, false)]
    [InlineData(1, true)]
    [InlineData(7, true)]
    [InlineData(4, false)]
    public void IsHappy_ReturnsSpecifiedResult(int n, bool expected)
        => Assert.Equal(expected, Solution.IsHappy(n));
}
