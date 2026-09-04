using Xunit;

public class MaxSlidingWindowTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MaxSlidingWindow(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

