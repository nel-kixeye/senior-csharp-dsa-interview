using Xunit;

public class LongestSubstringKDistinctTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LongestSubstringKDistinct("sample", 1);        Assert.NotEqual(0, actual);
    }
}

