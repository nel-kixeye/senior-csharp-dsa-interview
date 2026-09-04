using Xunit;

public class BubbleSortTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.BubbleSort(new[] { 1, 2, 3 });        Assert.Null(Record.Exception(() => Solution.BubbleSort(new[] { 1, 2, 3 })));
    }
}

