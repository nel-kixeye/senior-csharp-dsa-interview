using Xunit;

public class BrowserHistoryTests
{
    [Fact]
    public void BrowserHistory_BackAndForward_NavigateHistoryCorrectly()
    {
        var browser = new BrowserHistory("leetcode.com");
        browser.Visit("google.com");
        browser.Visit("facebook.com");
        browser.Visit("youtube.com");

        Assert.Equal("facebook.com", browser.Back(1));
        Assert.Equal("google.com", browser.Back(2));
        Assert.Equal("facebook.com", browser.Forward(1));

        browser.Visit("linkedin.com");
        Assert.Equal("linkedin.com", browser.Forward(2));
        Assert.Equal("google.com", browser.Back(2));
        Assert.Equal("leetcode.com", browser.Back(7));
    }
}