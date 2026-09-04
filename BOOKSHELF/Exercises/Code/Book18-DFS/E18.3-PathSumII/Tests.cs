using Xunit;

public class PathSumTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.PathSum(null, 1);        Assert.NotEqual(0, actual);
    }
}

