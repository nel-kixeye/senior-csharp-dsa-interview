using Xunit;

public class IntersectWithDuplicatesTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IntersectWithDuplicates(new[] { 1, 2, 3 }, new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

