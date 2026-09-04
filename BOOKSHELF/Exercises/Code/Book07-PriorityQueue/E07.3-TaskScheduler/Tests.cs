using Xunit;

public class LeastIntervalTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LeastInterval(new[] { 'a', 'b' }, 1);        Assert.NotEqual(0, actual);
    }
}

