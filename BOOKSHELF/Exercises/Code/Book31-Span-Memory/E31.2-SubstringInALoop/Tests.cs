using Xunit;

public class Find_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Find_Broken("sample", "sample");        Assert.NotEqual(0, actual);
    }
}

