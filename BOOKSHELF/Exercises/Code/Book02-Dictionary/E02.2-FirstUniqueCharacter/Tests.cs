using Xunit;

public class FirstUniqueCharacterTests
{
    [Theory]
    [InlineData("leetcode", 0)]
    [InlineData("loveleetcode", 2)]
    [InlineData("aabb", -1)]
    [InlineData("", -1)]
    [InlineData("aabbc", 4)]
    [InlineData("z", 0)]
    public void FirstUniqChar_ReturnsSpecifiedIndex(string input, int expected)
        => Assert.Equal(expected, Solution.FirstUniqChar(input));
}
