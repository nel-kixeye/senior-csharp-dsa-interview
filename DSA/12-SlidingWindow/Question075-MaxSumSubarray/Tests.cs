using Xunit;

public class MaxSumSubarrayTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MaxSumSubarray(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

