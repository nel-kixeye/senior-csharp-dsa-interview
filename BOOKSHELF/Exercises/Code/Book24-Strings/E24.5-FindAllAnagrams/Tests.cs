using Xunit;

public class FindAnagramsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FindAnagrams("sample", "sample");        Assert.NotEqual(0, actual);
    }
}

