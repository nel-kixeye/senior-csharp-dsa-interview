using Xunit;

public class NumIslandsTests
{
    [Fact]
    public void EmptyAndWaterOnlyGridsHaveNoIslands()
    {
        Assert.Equal(0, Solution.NumIslands([]));
        Assert.Equal(0, Solution.NumIslands([['0', '0'], ['0', '0']]));
    }

    [Fact]
    public void DiagonalLandCellsAreSeparateIslands()
    {
        var grid = new[] { new[] { '1', '0' }, new[] { '0', '1' } };

        Assert.Equal(2, Solution.NumIslands(grid));
    }

    [Fact]
    public void AdjacentLandCellsFormOneIsland()
    {
        var grid = new[] { new[] { '1', '1' }, new[] { '1', '0' } };

        Assert.Equal(1, Solution.NumIslands(grid));
    }
}

