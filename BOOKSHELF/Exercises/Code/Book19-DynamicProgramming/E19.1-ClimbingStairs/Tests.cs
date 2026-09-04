using Xunit;

public class ClimbStairsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ClimbStairs(1);        Assert.NotEqual(0, actual);
    }
}

