using Xunit;

public class UseAllTwelveTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.UseAllTwelve();        Assert.Null(Record.Exception(() => Solution.UseAllTwelve()));
    }
}

