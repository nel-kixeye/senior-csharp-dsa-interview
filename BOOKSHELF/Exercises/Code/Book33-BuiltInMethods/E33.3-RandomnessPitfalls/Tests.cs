using Xunit;

public class A_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.A_Broken();        Assert.NotEqual(0, actual);
    }
}

