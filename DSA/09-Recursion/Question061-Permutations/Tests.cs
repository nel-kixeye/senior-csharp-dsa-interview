using Xunit;

public class PermuteTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Permute(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

