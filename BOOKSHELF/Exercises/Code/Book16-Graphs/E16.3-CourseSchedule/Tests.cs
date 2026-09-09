using Xunit;

public class CanFinishTests
{
    [Fact]
    public void NoPrerequisitesCanAlwaysBeFinished()
    {
        Assert.True(Solution.CanFinish(3, []));
    }

    [Fact]
    public void DirectedCycleMakesScheduleImpossible()
    {
        Assert.False(Solution.CanFinish(2, [[1, 0], [0, 1]]));
        Assert.False(Solution.CanFinish(1, [[0, 0]]));
    }

    [Fact]
    public void DisconnectedAcyclicCoursesCanBeFinished()
    {
        Assert.True(Solution.CanFinish(4, [[1, 0], [2, 1], [3, 2], [1, 0]]));
    }
}

