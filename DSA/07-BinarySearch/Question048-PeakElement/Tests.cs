using Xunit;

public class FindPeakElementTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindPeakElement(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

