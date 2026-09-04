using Xunit;

public class ReverseBitsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ReverseBits(default);        Assert.NotEqual(0, actual);
    }
}

