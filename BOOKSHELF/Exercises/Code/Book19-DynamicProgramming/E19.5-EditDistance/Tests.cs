using Xunit;

public class MinDistanceTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MinDistance("sample", "sample");        Assert.NotEqual(0, actual);
    }
}

