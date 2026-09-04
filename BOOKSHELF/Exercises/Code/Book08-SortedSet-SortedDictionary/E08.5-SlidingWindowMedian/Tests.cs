using Xunit;

public class MedianSlidingWindowTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MedianSlidingWindow(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

