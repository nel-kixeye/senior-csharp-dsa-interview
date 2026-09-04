using Xunit;

public class IsAnagram_DictionaryTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.IsAnagram_Dictionary("sample", "sample");        Assert.True(actual);
    }
}

