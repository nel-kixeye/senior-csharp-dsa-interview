using Xunit;

public class FirstIndexOfTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FirstIndexOf(new[] { 1, 2, 3 }, 1);        Assert.NotEqual(0, actual);
    }
}

