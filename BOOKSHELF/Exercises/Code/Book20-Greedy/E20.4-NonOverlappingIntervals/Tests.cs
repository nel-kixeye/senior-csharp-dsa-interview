using Xunit;

public class EraseOverlapIntervalsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.EraseOverlapIntervals(default);        Assert.NotEqual(0, actual);
    }
}

