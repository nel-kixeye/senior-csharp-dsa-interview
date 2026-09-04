using Xunit;

public class SelectionSortTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.SelectionSort(new[] { 1, 2, 3 });        Assert.Null(Record.Exception(() => Solution.SelectionSort(new[] { 1, 2, 3 })));
    }
}

