using Xunit;

public class JoinNamesTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.JoinNames(new[] { "a", "b" });        Assert.NotNull(actual);
    }
}

