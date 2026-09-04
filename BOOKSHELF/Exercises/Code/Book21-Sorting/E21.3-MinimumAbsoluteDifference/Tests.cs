using Xunit;

public class MinimumAbsDifferenceTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MinimumAbsDifference(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

