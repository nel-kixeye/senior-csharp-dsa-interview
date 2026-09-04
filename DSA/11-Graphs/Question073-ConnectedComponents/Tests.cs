using Xunit;

public class CountComponentsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CountComponents(1, default);        Assert.NotEqual(0, actual);
    }
}

