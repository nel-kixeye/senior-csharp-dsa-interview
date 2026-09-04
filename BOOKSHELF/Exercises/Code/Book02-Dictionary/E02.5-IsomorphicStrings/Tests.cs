using Xunit;

public class IsomorphicStringsTests
{
    [Theory]
    [InlineData("egg", "add", true)]
    [InlineData("foo", "bar", false)]
    [InlineData("badc", "baba", false)]
    [InlineData("ab", "aa", false)]
    [InlineData("paper", "title", true)]
    [InlineData("ab", "abc", false)]
    public void IsIsomorphic_ReturnsSpecifiedResult(string s, string t, bool expected)
        => Assert.Equal(expected, Solution.IsIsomorphic(s, t));
}
