using Xunit;

public class MergeSortTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MergeSort(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

