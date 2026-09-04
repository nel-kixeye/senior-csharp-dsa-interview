using Xunit;

public class SpiralOrderTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SpiralOrder(default);        Assert.NotEqual(0, actual);
    }
}

