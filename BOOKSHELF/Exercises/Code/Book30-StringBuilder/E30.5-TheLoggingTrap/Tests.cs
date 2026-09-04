using Xunit;

public class Log_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Log_Broken(default, default, default);        Assert.Null(Record.Exception(() => Solution.Log_Broken(default, default, default)));
    }
}

