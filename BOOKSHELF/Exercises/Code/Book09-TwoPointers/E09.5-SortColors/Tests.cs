using Xunit;

public class SortColorsTests
{
    [Fact]
    public void SortsMixedColorsInPlace()
    {
        AssertSorts(new[] { 2, 0, 2, 1, 1, 0 }, new[] { 0, 0, 1, 1, 2, 2 });
    }

    [Fact]
    public void HandlesAlreadySortedArray()
    {
        AssertSorts(new[] { 0, 0, 1, 1, 2, 2 }, new[] { 0, 0, 1, 1, 2, 2 });
    }

    [Fact]
    public void HandlesReverseSortedArray()
    {
        AssertSorts(new[] { 2, 2, 1, 1, 0, 0 }, new[] { 0, 0, 1, 1, 2, 2 });
    }

    [Fact]
    public void HandlesArrayWithOnlyOneColor()
    {
        AssertSorts(new[] { 1, 1, 1 }, new[] { 1, 1, 1 });
    }

    [Fact]
    public void HandlesSingleElement()
    {
        AssertSorts(new[] { 2 }, new[] { 2 });
    }

    [Fact]
    public void HandlesMissingColors()
    {
        AssertSorts(new[] { 2, 2, 2, 2 }, new[] { 2, 2, 2, 2 });
    }

    private static void AssertSorts(int[] actual, int[] expected)
    {
        Solution.SortColors(actual);

        Assert.Equal(expected, actual);
    }
}

