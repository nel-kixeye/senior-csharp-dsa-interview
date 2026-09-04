using Xunit;

public class LadderLengthTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LadderLength("sample", "sample", default);        Assert.NotEqual(0, actual);
    }
}

