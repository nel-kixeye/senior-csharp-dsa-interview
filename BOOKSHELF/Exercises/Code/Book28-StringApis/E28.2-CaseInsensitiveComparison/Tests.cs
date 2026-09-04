using Xunit;

public class Compare1Tests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Compare1("sample", "sample");        Assert.True(actual);
    }
}

