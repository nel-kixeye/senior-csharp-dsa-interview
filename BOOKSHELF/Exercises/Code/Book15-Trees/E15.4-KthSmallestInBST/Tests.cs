using Xunit;

public class KthSmallestTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.KthSmallest(null, 1);        Assert.NotEqual(0, actual);
    }
}

