using Xunit;

public class GetIntersectionNodeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.GetIntersectionNode(null, null);        Assert.NotNull(actual);
    }
}

