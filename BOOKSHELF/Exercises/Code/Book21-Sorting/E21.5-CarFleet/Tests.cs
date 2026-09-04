using Xunit;

public class CarFleetTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CarFleet(1, new[] { 1, 2, 3 }, new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

