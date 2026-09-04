using Xunit;

public class IsValidBSTTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IsValidBST(null);        Assert.True(actual);
    }
}

