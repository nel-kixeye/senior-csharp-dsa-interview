using Xunit;

public class CountAsyncTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CountAsync(default);        Assert.NotEqual(0, actual);
    }
}

