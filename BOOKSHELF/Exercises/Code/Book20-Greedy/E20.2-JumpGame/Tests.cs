using Xunit;

public class CanJumpTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CanJump(new[] { 1, 2, 3 });        Assert.True(actual);
    }
}

