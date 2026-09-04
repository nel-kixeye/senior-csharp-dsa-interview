using Xunit;

public class WallsAndGatesTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.WallsAndGates(default);        Assert.Null(Record.Exception(() => Solution.WallsAndGates(default)));
    }
}

