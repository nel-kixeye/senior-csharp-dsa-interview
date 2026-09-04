using Xunit;

public class IsBalancedTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IsBalanced("sample");        Assert.True(actual);
    }
}

