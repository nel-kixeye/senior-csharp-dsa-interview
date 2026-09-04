using Xunit;

public class MergeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Merge(new[] { 1, 2, 3 }, 1, new[] { 1, 2, 3 }, 1);        Assert.Null(Record.Exception(() => Solution.Merge(new[] { 1, 2, 3 }, 1, new[] { 1, 2, 3 }, 1)));
    }
}

