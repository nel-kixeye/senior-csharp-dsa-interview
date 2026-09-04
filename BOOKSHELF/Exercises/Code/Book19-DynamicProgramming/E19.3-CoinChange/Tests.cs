using Xunit;

public class CoinChangeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CoinChange(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

