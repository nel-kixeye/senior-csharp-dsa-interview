using Xunit;

public class DetectCycleTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.DetectCycle(null);        Assert.NotNull(actual);
    }
}

