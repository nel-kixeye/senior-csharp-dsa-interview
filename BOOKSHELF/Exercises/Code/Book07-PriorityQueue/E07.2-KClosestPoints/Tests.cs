using Xunit;

public class KClosestTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.KClosest(default, 1);        Assert.NotEqual(0, actual);
    }
}

