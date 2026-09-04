using Xunit;

public class A_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.A_Broken(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

