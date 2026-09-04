using Xunit;

public class LongestIncreasingPathTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LongestIncreasingPath(default);        Assert.NotEqual(0, actual);
    }
}

