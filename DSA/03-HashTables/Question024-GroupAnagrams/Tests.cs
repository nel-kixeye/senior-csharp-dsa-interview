using Xunit;

public class GroupAnagramsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.GroupAnagrams(new[] { "a", "b" });        Assert.NotNull(actual);
    }
}

