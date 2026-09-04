using Xunit;

public class FindKthLargestTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindKthLargest(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

