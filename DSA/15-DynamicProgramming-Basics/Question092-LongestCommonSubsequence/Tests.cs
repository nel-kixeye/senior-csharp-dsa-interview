using Xunit;

public class LongestCommonSubsequenceTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.LongestCommonSubsequence("sample", "sample");        Assert.NotEqual(0, actual);
    }
}

