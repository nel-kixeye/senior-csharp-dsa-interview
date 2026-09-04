using Xunit;

public class GetSumTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.GetSum(1, 1);        Assert.NotEqual(0, actual);
    }
}

