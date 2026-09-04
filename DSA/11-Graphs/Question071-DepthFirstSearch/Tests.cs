using Xunit;

public class DFSTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.DFS(default, default, 1);        Assert.NotEqual(0, actual);
    }
}

