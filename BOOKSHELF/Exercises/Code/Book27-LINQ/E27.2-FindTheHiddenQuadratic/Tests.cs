using Xunit;

public class FindDuplicates_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindDuplicates_Broken(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

