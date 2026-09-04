using Xunit;

public class SplitArrayTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SplitArray(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

