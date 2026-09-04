using Xunit;

public class IntersectionTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Intersection(new[] { 1, 2, 3 }, new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

