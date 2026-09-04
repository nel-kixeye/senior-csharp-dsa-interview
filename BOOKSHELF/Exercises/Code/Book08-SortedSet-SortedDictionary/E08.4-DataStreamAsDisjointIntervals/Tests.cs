using Xunit;

public class SummaryRangesTests
{
    [Fact]
    public void GetIntervals_MergesAdjacentAndOverlappingRanges()
    {
        var ranges = new SummaryRanges();
        ranges.AddNum(1);
        ranges.AddNum(3);
        ranges.AddNum(7);
        ranges.AddNum(2);
        ranges.AddNum(6);

        Assert.Equal(new[]
        {
            new[] { 1, 3 },
            new[] { 6, 7 }
        }, ranges.GetIntervals());
    }

    [Fact]
    public void GetIntervals_DuplicateValuesDoNotChangeRangeSet()
    {
        var ranges = new SummaryRanges();
        ranges.AddNum(1);
        ranges.AddNum(1);

        Assert.Equal(new[] { new[] { 1, 1 } }, ranges.GetIntervals());
    }

    [Fact]
    public void GetIntervals_ExtendsRangeOnBothSides()
    {
        var ranges = new SummaryRanges();
        ranges.AddNum(5);
        ranges.AddNum(4);
        ranges.AddNum(6);

        Assert.Equal(new[] { new[] { 4, 6 } }, ranges.GetIntervals());
    }
}
