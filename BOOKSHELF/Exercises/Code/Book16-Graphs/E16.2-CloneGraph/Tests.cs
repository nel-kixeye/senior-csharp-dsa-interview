using Xunit;

public class CloneGraphTests
{
    [Fact]
    public void NullGraphReturnsNull()
    {
        Assert.Null(Solution.CloneGraph(null));
    }

    [Fact]
    public void IsolatedNodeIsCopiedWithoutSharingIdentity()
    {
        var original = new Node(7);

        var actual = Solution.CloneGraph(original);

        Assert.NotNull(actual);
        Assert.NotSame(original, actual);
        Assert.Equal(7, actual.val);
        Assert.Empty(actual.neighbors);
    }

    [Fact]
    public void CyclicGraphIsDeepCloned()
    {
        var first = new Node(1);
        var second = new Node(2);
        first.neighbors.Add(second);
        second.neighbors.Add(first);

        var actual = Solution.CloneGraph(first);

        Assert.NotNull(actual);
        Assert.NotSame(first, actual);
        Assert.Equal(1, actual.val);
        Assert.Single(actual.neighbors);
        Assert.NotSame(second, actual.neighbors[0]);
        Assert.Same(actual, actual.neighbors[0].neighbors[0]);
    }
}

