using Xunit;

public class ReverseTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Reverse(1);        Assert.NotEqual(0, actual);
    }
}

