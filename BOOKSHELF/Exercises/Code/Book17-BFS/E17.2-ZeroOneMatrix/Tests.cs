using Xunit;

public class UpdateMatrixTests
{
    [Fact]
    public void ExistingZeroesRemainZero()
    {
        Assert.Equal(new[] { new[] { 0, 0 }, new[] { 0, 0 } },
            Solution.UpdateMatrix([[0, 0], [0, 0]]));
    }

    [Fact]
    public void DistancesIncreaseAwayFromTheNearestZero()
    {
        var actual = Solution.UpdateMatrix([[0, 1, 1], [1, 1, 1]]);

        Assert.Equal(new[] { new[] { 0, 1, 2 }, new[] { 1, 2, 3 } }, actual);
    }

    [Fact]
    public void SingleRowUsesTheClosestZeroOnEitherSide()
    {
        Assert.Equal(new[] { new[] { 2, 1, 0, 1, 2 } },
            Solution.UpdateMatrix([[1, 1, 0, 1, 1]]));
    }
}

