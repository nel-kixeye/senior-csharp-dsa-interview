using Xunit;

public class SolveTests
{
    [Fact]
    public void CapturesOnlyRegionsNotConnectedToTheBorder()
    {
        var board = new[] { new[] { 'X', 'X', 'X' }, new[] { 'X', 'O', 'X' }, new[] { 'X', 'X', 'X' } };

        Solution.Solve(board);

        Assert.Equal(new[] { new[] { 'X', 'X', 'X' }, new[] { 'X', 'X', 'X' }, new[] { 'X', 'X', 'X' } }, board);
    }

    [Fact]
    public void BorderConnectedRegionsRemainOpen()
    {
        var board = new[] { new[] { 'O', 'X' }, new[] { 'X', 'O' } };

        Solution.Solve(board);

        Assert.Equal(new[] { new[] { 'O', 'X' }, new[] { 'X', 'O' } }, board);
    }
}

