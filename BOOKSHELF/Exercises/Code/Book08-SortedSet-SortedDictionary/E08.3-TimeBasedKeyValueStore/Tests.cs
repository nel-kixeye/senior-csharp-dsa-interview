using Xunit;

public class TimeMapTests
{
    [Fact]
    public void Get_ReturnsLatestValueAtOrBeforeRequestedTimestamp()
    {
        var timeMap = new TimeMap();
        timeMap.Set("foo", "bar", 1);
        Assert.Equal("bar", timeMap.Get("foo", 1));
        Assert.Equal("bar", timeMap.Get("foo", 3));

        timeMap.Set("foo", "bar2", 4);
        Assert.Equal("bar2", timeMap.Get("foo", 4));
        Assert.Equal("bar2", timeMap.Get("foo", 5));
    }

    [Fact]
    public void Get_OnMissingKey_ReturnsEmptyString()
    {
        var timeMap = new TimeMap();

        Assert.Equal(string.Empty, timeMap.Get("nope", 1));
    }

    [Fact]
    public void Get_WhenTimestampIsEarlierThanAllStoredValues_ReturnsEmptyString()
    {
        var timeMap = new TimeMap();
        timeMap.Set("a", "x", 5);

        Assert.Equal(string.Empty, timeMap.Get("a", 1));
    }
}
