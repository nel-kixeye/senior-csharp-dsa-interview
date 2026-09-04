using Xunit;

public class InorderTraversalTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.InorderTraversal(null);        Assert.NotEqual(0, actual);
    }
}

