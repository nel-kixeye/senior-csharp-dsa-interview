using Xunit;

public class TwoSumTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.TwoSum(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

