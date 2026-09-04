using Xunit;

public class Record_BrokenTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Record_Broken("sample");        Assert.Null(Record.Exception(() => Solution.Record_Broken("sample")));
    }
}

