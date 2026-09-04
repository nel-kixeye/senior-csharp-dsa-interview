using Xunit;

public class SolveNQueensTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SolveNQueens(1);        Assert.NotNull(actual);
    }
}

