using Xunit;

public class WordPatternTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.WordPattern("sample", "sample");        Assert.True(actual);
    }
}

