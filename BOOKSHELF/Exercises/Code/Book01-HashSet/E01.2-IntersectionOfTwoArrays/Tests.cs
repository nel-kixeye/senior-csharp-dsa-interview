using Xunit;

public class IntersectionOfTwoArraysTests
{
    [Theory]
    [InlineData(new[] { 1, 2, 2, 1 }, new[] { 2, 2 }, new[] { 2 })]
    [InlineData(new[] { 4, 9, 5 }, new[] { 9, 4, 9, 8, 4 }, new[] { 4, 9 })]
    [InlineData(new[] { 1, 2 }, new[] { 3, 4 }, new int[0])]
    [InlineData(new int[0], new[] { 1, 2 }, new int[0])]
    [InlineData(new[] { 1, 2, 3 }, new[] { 1, 2, 3 }, new[] { 1, 2, 3 })]
    public void Intersection_ReturnsSpecifiedUniqueValues(int[] a, int[] b, int[] expected)
    {
        var actual = Solution.Intersection(a, b);
        Assert.Equal(expected.OrderBy(value => value), actual.OrderBy(value => value));
        Assert.Equal(actual.Length, actual.Distinct().Count());
    }
}
