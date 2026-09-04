using Xunit;

public class LongestCommonPrefixTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LongestCommonPrefix(new[] { "a", "b" });        Assert.NotNull(actual);
    }
}

