using Xunit;

public class ReorderListTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ReorderList(null);        Assert.Null(Record.Exception(() => Solution.ReorderList(null)));
    }
}

