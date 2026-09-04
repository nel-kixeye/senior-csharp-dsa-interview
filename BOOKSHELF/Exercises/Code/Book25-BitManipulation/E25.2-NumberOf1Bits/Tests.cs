using Xunit;

public class HammingWeightTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.HammingWeight(default);        Assert.NotEqual(0, actual);
    }
}

