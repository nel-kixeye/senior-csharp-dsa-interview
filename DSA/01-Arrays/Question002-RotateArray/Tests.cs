using Xunit;

public class RotateWithExtraSpaceTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.RotateWithExtraSpace(new[] { 1, 2, 3 }, 1);        Assert.Null(Record.Exception(() => Solution.RotateWithExtraSpace(new[] { 1, 2, 3 }, 1)));
    }
}

