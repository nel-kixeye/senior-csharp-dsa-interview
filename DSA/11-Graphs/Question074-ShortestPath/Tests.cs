using Xunit;

public class ShortestPathTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ShortestPath(default, default, 1, 1);        Assert.NotEqual(0, actual);
    }
}

