using Xunit;

public class SearchTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Search(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

