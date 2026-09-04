using Xunit;

public class MaxSubArrayTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MaxSubArray(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

