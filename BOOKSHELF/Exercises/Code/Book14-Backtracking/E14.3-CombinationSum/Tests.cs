using Xunit;

public class CombinationSumTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CombinationSum(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

