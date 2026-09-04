using Xunit;

public class SubsetsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Subsets(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

