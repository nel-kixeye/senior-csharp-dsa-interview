using Xunit;

public class NumIslandsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.NumIslands(default);        Assert.NotEqual(0, actual);
    }
}

