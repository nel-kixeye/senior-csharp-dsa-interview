using Xunit;

public class GroupAnagramsTests
{
    [Theory]
    [MemberData(nameof(Cases))]
    public void GroupAnagrams_ReturnsSpecifiedGroups(string[] words, string[][] expected)
        => Assert.Equal(Normalize(expected), Normalize(Solution.GroupAnagrams(words)));

    public static IEnumerable<object[]> Cases =>
    [
        [new[] { "eat", "tea", "tan", "ate", "nat", "bat" }, new[] { new[] { "eat", "tea", "ate" }, new[] { "tan", "nat" }, new[] { "bat" } }],
        [new[] { "" }, new[] { new[] { "" } }],
        [new[] { "a" }, new[] { new[] { "a" } }],
        [new[] { "abc", "def", "ghi" }, new[] { new[] { "abc" }, new[] { "def" }, new[] { "ghi" } }],
        [new[] { "abc", "bca", "cab" }, new[] { new[] { "abc", "bca", "cab" } }]
    ];

    private static string[] Normalize(IEnumerable<IEnumerable<string>> groups) =>
        groups.Select(group => string.Join(",", group.OrderBy(word => word))).OrderBy(group => group).ToArray();
}
