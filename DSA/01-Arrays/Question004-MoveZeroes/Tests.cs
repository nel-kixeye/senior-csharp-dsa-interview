using Xunit;

public class MoveZeroesTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.MoveZeroes(new[] { 1, 2, 3 });        Assert.Null(Record.Exception(() => Solution.MoveZeroes(new[] { 1, 2, 3 })));
    }
}

