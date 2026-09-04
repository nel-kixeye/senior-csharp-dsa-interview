using Xunit;

public class CharFrequencyTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CharFrequency("sample");        Assert.NotEqual(0, actual);
    }
}

