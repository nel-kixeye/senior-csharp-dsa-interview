using Xunit;

public class SubarraySumTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SubarraySum(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

