using Xunit;

public class LevelOrderTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LevelOrder(null);        Assert.NotEqual(0, actual);
    }
}

