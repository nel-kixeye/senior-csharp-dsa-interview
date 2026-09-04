using Xunit;

public class CheckInclusionTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CheckInclusion("sample", "sample");        Assert.True(actual);
    }
}

