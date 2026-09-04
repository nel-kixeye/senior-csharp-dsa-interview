using Xunit;

public class ReverseTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Reverse(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

