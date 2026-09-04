using Xunit;

public class ThreeSumTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ThreeSum(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

