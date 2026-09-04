using Xunit;

public class BusinessDaysBetweenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.BusinessDaysBetween(default, default, default);        Assert.NotEqual(0, actual);
    }
}

