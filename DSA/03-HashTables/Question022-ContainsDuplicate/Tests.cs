using Xunit;

public class ContainsDuplicateTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ContainsDuplicate(new[] { 1, 2, 3 });        Assert.True(actual);
    }
}

