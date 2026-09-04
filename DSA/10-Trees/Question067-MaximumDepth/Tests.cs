using Xunit;

public class MaxDepthTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MaxDepth(null);        Assert.NotEqual(0, actual);
    }
}

