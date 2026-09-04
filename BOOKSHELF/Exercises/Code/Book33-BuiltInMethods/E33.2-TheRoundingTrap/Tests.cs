using Xunit;

public class RoundMoneyTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.RoundMoney(1.0);        Assert.NotEqual(0, actual);
    }
}

