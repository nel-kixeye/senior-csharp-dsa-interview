using Xunit;

public class HIndexTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.HIndex(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

