using Xunit;

public class TopKFrequentTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.TopKFrequent(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

