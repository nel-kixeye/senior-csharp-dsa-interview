using Xunit;

public class ContainsNearbyAlmostDuplicateTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ContainsNearbyAlmostDuplicate(new[] { 1, 2, 3 }, 1, 1);        Assert.True(actual);
    }
}

