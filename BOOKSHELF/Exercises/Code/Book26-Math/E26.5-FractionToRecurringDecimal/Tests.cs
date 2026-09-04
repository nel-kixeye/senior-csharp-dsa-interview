using Xunit;

public class FractionToDecimalTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FractionToDecimal(1, 1);        Assert.NotNull(actual);
    }
}

