using Xunit;

public class LongestPalindromeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LongestPalindrome("sample");        Assert.NotNull(actual);
    }
}

