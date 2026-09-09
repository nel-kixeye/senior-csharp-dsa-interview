using Xunit;

public class CheckInclusionTests
{
    [Theory]
    [InlineData("ab", "eidbaooo", true)]
    [InlineData("ab", "eidboaoo", false)]
    [InlineData("abc", "abc", true)]
    [InlineData("abc", "cba", true)]
    [InlineData("abcd", "abc", false)]
    [InlineData("aab", "eidbaaooo", true)]
    [InlineData("aab", "eidboaoo", false)]
    [InlineData("a", "a", true)]
    [InlineData("a", "b", false)]
    public void CheckInclusion_ReturnsWhetherPermutationExists(string s1, string s2, bool expected)
    {
        var actual = Solution.CheckInclusion(s1, s2);

        Assert.Equal(expected, actual);
    }
}

