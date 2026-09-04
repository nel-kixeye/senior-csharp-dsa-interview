using Xunit;

public class MyPowTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MyPow(1.0, 1);        Assert.NotEqual(0, actual);
    }
}

