using Xunit;

public class RomanToIntTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.RomanToInt("sample");        Assert.NotEqual(0, actual);
    }
}

