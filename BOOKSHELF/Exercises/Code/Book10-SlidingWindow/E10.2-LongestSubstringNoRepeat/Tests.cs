using Xunit;

public class LengthOfLongestSubstringTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LengthOfLongestSubstring("sample");        Assert.NotEqual(0, actual);
    }
}

