using Xunit;

public class MaxProfitTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MaxProfit(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

