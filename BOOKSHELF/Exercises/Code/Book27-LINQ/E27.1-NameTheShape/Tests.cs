using Xunit;

public class TotalForYearTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.TotalForYear(default, 1);        Assert.NotEqual(0, actual);
    }
}

