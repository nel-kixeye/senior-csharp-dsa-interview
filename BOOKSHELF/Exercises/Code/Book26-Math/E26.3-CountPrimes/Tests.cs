using Xunit;

public class CountPrimesTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CountPrimes(1);        Assert.NotEqual(0, actual);
    }
}

