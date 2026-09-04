using Xunit;

public class CloneGraphTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CloneGraph(null);        Assert.NotNull(actual);
    }
}

