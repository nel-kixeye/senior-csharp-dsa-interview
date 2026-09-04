using Xunit;

public class MinEatingSpeedTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MinEatingSpeed(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

