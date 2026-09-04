using Xunit;

public class BFSTraversalTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.BFSTraversal(default, default, 1);        Assert.NotEqual(0, actual);
    }
}

