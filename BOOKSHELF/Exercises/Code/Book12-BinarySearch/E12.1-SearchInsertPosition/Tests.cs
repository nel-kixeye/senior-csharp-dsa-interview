using Xunit;

public class SearchInsertTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SearchInsert(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

