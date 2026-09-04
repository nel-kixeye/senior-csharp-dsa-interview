using Xunit;

public class DailyTemperaturesTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.DailyTemperatures(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

