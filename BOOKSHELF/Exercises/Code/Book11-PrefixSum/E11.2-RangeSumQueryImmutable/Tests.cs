using Xunit;

public class NumArrayTests
{
    [Fact]
    public void SumRange_ReturnsInclusiveRangeSum()
    {
        var array = new NumArray(new[] { -2, 0, 3, -5, 2, -1 });

        Assert.Equal(1, array.SumRange(0, 2));
        Assert.Equal(-1, array.SumRange(2, 5));
        Assert.Equal(-3, array.SumRange(0, 5));
        Assert.Equal(-5, array.SumRange(3, 3));
        Assert.Equal(-2, array.SumRange(0, 0));
    }
}
