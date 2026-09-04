using Xunit;

public class EvalRPNTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.EvalRPN(new[] { "a", "b" });        Assert.NotEqual(0, actual);
    }
}

