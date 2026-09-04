using Xunit;

public class CountBitsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CountBits(1);        Assert.NotEqual(0, actual);
    }
}

