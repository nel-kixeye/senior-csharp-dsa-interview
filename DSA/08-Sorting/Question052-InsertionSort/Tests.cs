using Xunit;

public class InsertionSortTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.InsertionSort(new[] { 1, 2, 3 });        Assert.Null(Record.Exception(() => Solution.InsertionSort(new[] { 1, 2, 3 })));
    }
}

