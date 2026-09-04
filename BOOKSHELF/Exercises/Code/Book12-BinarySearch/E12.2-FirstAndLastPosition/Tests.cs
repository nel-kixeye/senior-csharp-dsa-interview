using Xunit;

public class SearchRangeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SearchRange(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

