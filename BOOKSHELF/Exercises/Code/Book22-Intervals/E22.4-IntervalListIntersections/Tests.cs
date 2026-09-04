using Xunit;

public class IntervalIntersectionTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IntervalIntersection(default, default);        Assert.NotEqual(0, actual);
    }
}

