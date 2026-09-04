using Xunit;

public class MergeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Merge(default);        Assert.NotEqual(0, actual);
    }
}

