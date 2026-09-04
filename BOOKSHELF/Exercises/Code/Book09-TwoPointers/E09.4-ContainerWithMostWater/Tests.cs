using Xunit;

public class MaxAreaTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MaxArea(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

