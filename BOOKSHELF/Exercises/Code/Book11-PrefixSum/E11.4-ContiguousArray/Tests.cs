using Xunit;

public class FindMaxLengthTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindMaxLength(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

