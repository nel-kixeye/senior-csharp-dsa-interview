using Xunit;

public class QuickSortTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.QuickSort(new[] { 1, 2, 3 }, 1, 1);        Assert.Null(Record.Exception(() => Solution.QuickSort(new[] { 1, 2, 3 }, 1, 1)));
    }
}

