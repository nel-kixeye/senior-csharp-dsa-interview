using Xunit;

public class PreorderTraversalTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.PreorderTraversal(null);        Assert.NotEqual(0, actual);
    }
}

