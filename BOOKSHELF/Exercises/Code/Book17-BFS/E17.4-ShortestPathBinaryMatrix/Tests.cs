using Xunit;

public class ShortestPathBinaryMatrixTests
{
    [Fact]
    public void SingleOpenCellHasPathLengthOne()
    {
        Assert.Equal(1, Solution.ShortestPathBinaryMatrix([[0]]));
    }

    [Fact]
    public void BlockedStartOrEndIsUnreachable()
    {
        Assert.Equal(-1, Solution.ShortestPathBinaryMatrix([[1, 0], [0, 0]]));
        Assert.Equal(-1, Solution.ShortestPathBinaryMatrix([[0, 0], [0, 1]]));
    }

    [Fact]
    public void ClearTwoByTwoGridUsesDiagonal()
    {
        Assert.Equal(2, Solution.ShortestPathBinaryMatrix([[0, 0], [0, 0]]));
    }
}

