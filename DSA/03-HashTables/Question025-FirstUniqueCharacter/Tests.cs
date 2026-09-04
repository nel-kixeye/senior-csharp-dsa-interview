using Xunit;

public class FirstUniqCharTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FirstUniqChar("sample");        Assert.NotEqual(0, actual);
    }
}

