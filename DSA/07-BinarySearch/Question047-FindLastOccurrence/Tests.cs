using Xunit;

public class FindLastTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindLast(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

