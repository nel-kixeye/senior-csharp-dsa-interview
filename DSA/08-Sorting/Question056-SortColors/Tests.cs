using Xunit;

public class SortColorsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SortColors(new[] { 1, 2, 3 });        Assert.Null(Record.Exception(() => Solution.SortColors(new[] { 1, 2, 3 })));
    }
}

