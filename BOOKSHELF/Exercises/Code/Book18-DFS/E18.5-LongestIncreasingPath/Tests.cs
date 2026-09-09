using Xunit;

public class LongestIncreasingPathTests
{
    [Fact]
    public void SingleCellAndEqualValuesHavePathLengthOne()
    {
        Assert.Equal(1, Solution.LongestIncreasingPath([[7]]));
        Assert.Equal(1, Solution.LongestIncreasingPath([[2, 2], [2, 2]]));
    }

    [Fact]
    public void FindsIncreasingPathAcrossAWholeRow()
    {
        Assert.Equal(3, Solution.LongestIncreasingPath([[1, 2, 3]]));
    }

    [Fact]
    public void DoesNotTreatDecreasingStepsAsIncreasing()
    {
        Assert.Equal(5, Solution.LongestIncreasingPath([[9, 8, 7], [6, 5, 4], [3, 2, 1]]));
    }
}

