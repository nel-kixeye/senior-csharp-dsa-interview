using Xunit;

public class WordBreakTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.WordBreak("sample", default);        Assert.True(actual);
    }
}

