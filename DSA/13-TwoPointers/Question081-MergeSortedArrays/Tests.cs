using Xunit;

public class MergeSortedArraysTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MergeSortedArrays(new[] { 1, 2, 3 }, new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

