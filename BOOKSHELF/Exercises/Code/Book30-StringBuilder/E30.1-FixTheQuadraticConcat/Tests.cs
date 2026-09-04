using Xunit;

public class A_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.A_Broken(new[] { "a", "b" });        Assert.NotNull(actual);
    }
}

