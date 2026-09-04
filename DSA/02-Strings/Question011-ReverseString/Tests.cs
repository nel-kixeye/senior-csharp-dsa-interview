using Xunit;

public class ReverseStringTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ReverseString(new[] { 'a', 'b' });        Assert.Null(Record.Exception(() => Solution.ReverseString(new[] { 'a', 'b' })));
    }
}

