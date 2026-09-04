using Xunit;

public class IsPalindromeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IsPalindrome("sample");        Assert.True(actual);
    }
}

