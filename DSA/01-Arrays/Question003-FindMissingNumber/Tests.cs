using Xunit;

public class FindMissingTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindMissing(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

