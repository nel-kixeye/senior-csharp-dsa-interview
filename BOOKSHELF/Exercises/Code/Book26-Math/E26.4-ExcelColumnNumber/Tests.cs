using Xunit;

public class TitleToNumberTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.TitleToNumber("sample");        Assert.NotEqual(0, actual);
    }
}

