using Xunit;

public class SolveTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Solve(default);        Assert.Null(Record.Exception(() => Solution.Solve(default)));
    }
}

