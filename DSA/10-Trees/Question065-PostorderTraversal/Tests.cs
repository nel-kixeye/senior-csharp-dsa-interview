using Xunit;

public class PostorderTraversalTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.PostorderTraversal(null);        Assert.NotEqual(0, actual);
    }
}

