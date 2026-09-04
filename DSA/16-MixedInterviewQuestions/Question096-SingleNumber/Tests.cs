using Xunit;

public class SingleNumberTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SingleNumber(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

