using Xunit;

public class IsJsonTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IsJson("sample");        Assert.True(actual);
    }
}

