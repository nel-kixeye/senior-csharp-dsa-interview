using Xunit;

public class MedianFinderTests
{
    [Fact]
    public void FindMedian_WithEvenCount_ReturnsAverageOfMiddleTwo()
    {
        var finder = new MedianFinder();
        finder.AddNum(1);
        finder.AddNum(2);

        Assert.Equal(1.5d, finder.FindMedian());
    }

    [Fact]
    public void FindMedian_WithOddCount_ReturnsMiddleValue()
    {
        var finder = new MedianFinder();
        finder.AddNum(5);

        Assert.Equal(5d, finder.FindMedian());
    }

    [Fact]
    public void FindMedian_WithDescendingInput_StillBalances()
    {
        var finder = new MedianFinder();
        finder.AddNum(5);
        finder.AddNum(4);
        finder.AddNum(3);
        finder.AddNum(2);
        finder.AddNum(1);

        Assert.Equal(3d, finder.FindMedian());
    }
}

