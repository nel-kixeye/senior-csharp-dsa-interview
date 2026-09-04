using Xunit;

public class CharacterReplacementTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CharacterReplacement("sample", 1);        Assert.NotEqual(0, actual);
    }
}

