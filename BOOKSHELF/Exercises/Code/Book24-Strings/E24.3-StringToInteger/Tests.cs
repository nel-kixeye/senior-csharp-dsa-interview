using Xunit;

public class MyAtoiTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MyAtoi("sample");        Assert.NotEqual(0, actual);
    }
}

