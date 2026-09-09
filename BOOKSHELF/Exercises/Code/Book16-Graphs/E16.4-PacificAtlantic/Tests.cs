using Xunit;

public class PacificAtlanticTests
{
    [Fact]
    public void SingleCellReachesBothOceans()
    {
        Assert.Equal([[0, 0]], Solution.PacificAtlantic([[7]]));
    }

    [Fact]
    public void IncreasingRowAllowsEveryCellToReachBothOceans()
    {
        Assert.Equal([[0, 0], [0, 1], [0, 2]], Solution.PacificAtlantic([[1, 2, 3]]));
    }

    [Fact]
    public void TwoByTwoGridReturnsOnlyCellsConnectedToBothEdges()
    {
        var actual = Solution.PacificAtlantic([[1, 2], [3, 4]])
            .Select(cell => string.Join(',', cell));

        Assert.Equal(["0,1", "1,0", "1,1"], actual);
    }
}

