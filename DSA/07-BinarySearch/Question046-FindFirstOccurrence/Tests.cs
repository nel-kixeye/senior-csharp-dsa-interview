using Xunit;

public class FindFirstTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindFirst(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

