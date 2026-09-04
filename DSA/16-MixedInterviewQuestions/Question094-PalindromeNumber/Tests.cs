using Xunit;

public class IsPalindromeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IsPalindrome(1);        Assert.True(actual);
    }
}

