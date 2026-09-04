using Xunit;

public class OpenLockTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.OpenLock(new[] { "a", "b" }, "sample");        Assert.NotEqual(0, actual);
    }
}

