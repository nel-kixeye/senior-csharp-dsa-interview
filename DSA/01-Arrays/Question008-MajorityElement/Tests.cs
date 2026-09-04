using Xunit;

public class MajorityElementTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MajorityElement(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

