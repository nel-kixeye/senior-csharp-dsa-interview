using Xunit;

public class LongestConsecutiveTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LongestConsecutive(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

