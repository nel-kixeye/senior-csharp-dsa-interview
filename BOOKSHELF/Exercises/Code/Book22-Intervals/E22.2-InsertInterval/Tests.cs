using Xunit;

public class InsertTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Insert(default, new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

