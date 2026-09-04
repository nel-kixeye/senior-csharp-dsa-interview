using Xunit;

public class DepthSumTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.DepthSum(default);        Assert.NotEqual(0, actual);
    }
}

