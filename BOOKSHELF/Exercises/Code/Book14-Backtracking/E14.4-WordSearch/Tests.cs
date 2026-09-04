using Xunit;

public class ExistTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Exist(default, "sample");        Assert.True(actual);
    }
}

