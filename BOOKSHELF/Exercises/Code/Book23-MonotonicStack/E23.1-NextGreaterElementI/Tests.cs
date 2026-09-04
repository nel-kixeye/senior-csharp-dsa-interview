using Xunit;

public class NextGreaterElementTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.NextGreaterElement(new[] { 1, 2, 3 }, new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

