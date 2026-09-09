using Xunit;

public class FindRedundantConnectionTests
{
    [Fact]
    public void ReturnsTheEdgeThatClosesAThreeNodeCycle()
    {
        Assert.Equal([2, 3], Solution.FindRedundantConnection([[1, 2], [1, 3], [2, 3]]));
    }

    [Fact]
    public void ReturnsTheLastEdgeThatCreatesAConnection()
    {
        var edges = new[]
        {
            new[] { 1, 2 }, new[] { 2, 3 }, new[] { 3, 4 },
            new[] { 1, 4 }, new[] { 1, 5 }
        };

        Assert.Equal([1, 4], Solution.FindRedundantConnection(edges));
    }
}

