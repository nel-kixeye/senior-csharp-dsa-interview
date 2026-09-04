using Xunit;

public class BFSTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.BFS(default, default, 1);        Assert.NotEqual(0, actual);
    }
}

