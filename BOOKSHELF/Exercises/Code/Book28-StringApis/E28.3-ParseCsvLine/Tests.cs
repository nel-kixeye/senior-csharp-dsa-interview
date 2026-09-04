using Xunit;

public class Parse_NaiveTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Parse_Naive("sample");        Assert.NotNull(actual);
    }
}

