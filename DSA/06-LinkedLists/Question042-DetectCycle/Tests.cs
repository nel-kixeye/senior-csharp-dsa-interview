using Xunit;

public class HasCycleTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.HasCycle(null);        Assert.True(actual);
    }
}

