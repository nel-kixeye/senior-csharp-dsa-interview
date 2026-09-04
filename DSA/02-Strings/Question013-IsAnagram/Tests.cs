using Xunit;

public class IsAnagramTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IsAnagram("sample", "sample");        Assert.True(actual);
    }
}

