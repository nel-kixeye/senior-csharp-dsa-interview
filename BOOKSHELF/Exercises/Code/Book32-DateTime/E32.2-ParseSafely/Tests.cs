using Xunit;

public class Parse_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Parse_Broken("sample");        Assert.NotNull(actual);
    }
}

