using Xunit;

public class PivotIndexTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.PivotIndex(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

