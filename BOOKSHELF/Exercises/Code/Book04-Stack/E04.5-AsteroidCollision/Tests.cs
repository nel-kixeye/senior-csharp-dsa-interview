using Xunit;

public class AsteroidCollisionTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.AsteroidCollision(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

