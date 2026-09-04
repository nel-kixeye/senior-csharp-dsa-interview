using Xunit;

public class MySqrtTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MySqrt(1);        Assert.NotEqual(0, actual);
    }
}

