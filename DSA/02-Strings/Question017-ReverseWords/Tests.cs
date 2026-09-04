using Xunit;

public class ReverseWordsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ReverseWords("sample");        Assert.NotNull(actual);
    }
}

