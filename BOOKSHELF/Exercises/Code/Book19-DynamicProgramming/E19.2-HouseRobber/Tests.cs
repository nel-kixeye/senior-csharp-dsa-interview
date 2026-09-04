using Xunit;

public class RobTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Rob(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

