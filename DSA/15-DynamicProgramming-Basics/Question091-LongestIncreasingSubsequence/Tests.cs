using Xunit;

public class LengthOfLISTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LengthOfLIS(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

