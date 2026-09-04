using Xunit;

public class FindRedundantConnectionTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindRedundantConnection(default);        Assert.NotEqual(0, actual);
    }
}

