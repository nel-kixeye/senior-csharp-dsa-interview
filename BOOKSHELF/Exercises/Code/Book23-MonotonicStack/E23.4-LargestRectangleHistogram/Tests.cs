using Xunit;

public class LargestRectangleAreaTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LargestRectangleArea(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

