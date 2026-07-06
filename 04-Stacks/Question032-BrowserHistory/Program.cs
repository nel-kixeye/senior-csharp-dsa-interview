try
{
    var browser = new BrowserHistory("leetcode.com");
    browser.Visit("google.com");
    browser.Visit("facebook.com");
    browser.Visit("youtube.com");
    Console.WriteLine(browser.Back(1));
    Console.WriteLine(browser.Back(1));
    Console.WriteLine(browser.Forward(1));
    browser.Visit("linkedin.com");
    Console.WriteLine(browser.Forward(2));
    Console.WriteLine(browser.Back(2));
    Console.WriteLine(browser.Back(7));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}