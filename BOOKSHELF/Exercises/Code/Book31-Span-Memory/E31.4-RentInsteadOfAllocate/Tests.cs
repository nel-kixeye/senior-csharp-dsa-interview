using Xunit;

public class Process_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Process_Broken(default);        Assert.NotEqual(0, actual);
    }
}

