using Xunit;

public class GenerateParenthesisTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.GenerateParenthesis(1);        Assert.NotNull(actual);
    }
}

