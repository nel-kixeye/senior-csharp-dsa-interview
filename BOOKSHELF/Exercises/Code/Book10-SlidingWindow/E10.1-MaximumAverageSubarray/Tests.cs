using Xunit;

public class FindMaxAverageTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindMaxAverage(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

