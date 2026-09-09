using Xunit;

public class MaxAreaOfIslandTests
{
    [Fact]
    public void WaterOnlyGridHasAreaZero()
    {
        Assert.Equal(0, Solution.MaxAreaOfIsland([[0, 0], [0, 0]]));
    }

    [Fact]
    public void CountsTheLargestFourDirectionalIsland()
    {
        Assert.Equal(4, Solution.MaxAreaOfIsland([[1, 1], [1, 1]]));
        Assert.Equal(2, Solution.MaxAreaOfIsland([[1, 0, 1], [1, 0, 1]]));
    }

    [Fact]
    public void SingleLandCellHasAreaOne()
    {
        Assert.Equal(1, Solution.MaxAreaOfIsland([[1]]));
    }
}

