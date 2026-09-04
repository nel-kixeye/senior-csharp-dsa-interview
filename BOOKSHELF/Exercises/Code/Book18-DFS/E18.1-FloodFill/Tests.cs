using Xunit;

public class FloodFillTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FloodFill(default, 1, 1, 1);        Assert.NotEqual(0, actual);
    }
}

