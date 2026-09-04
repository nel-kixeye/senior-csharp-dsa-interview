using Xunit;

public class RecentCounterTests
{
    [Fact]
    public void Ping_ReturnsCorrectCountWithinWindow()
    {
        var counter = new RecentCounter();

        Assert.Equal(1, counter.Ping(1));
        Assert.Equal(2, counter.Ping(100));
        Assert.Equal(3, counter.Ping(3001));
        Assert.Equal(3, counter.Ping(3002));
    }

    [Fact]
    public void Ping_WithLongGap_ResetsWindow()
    {
        var counter = new RecentCounter();
        Assert.Equal(1, counter.Ping(1));
        Assert.Equal(1, counter.Ping(10000));
    }

    [Fact]
    public void Ping_BoundaryIsInclusive()
    {
        var counter = new RecentCounter();
        Assert.Equal(1, counter.Ping(1));
        Assert.Equal(2, counter.Ping(3001));
    }
}

