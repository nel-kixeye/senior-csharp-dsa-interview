using Xunit;

public class MaxAreaOfIslandTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MaxAreaOfIsland(default);        Assert.NotEqual(0, actual);
    }
}

