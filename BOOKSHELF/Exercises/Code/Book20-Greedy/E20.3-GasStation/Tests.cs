using Xunit;

public class CanCompleteCircuitTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CanCompleteCircuit(new[] { 1, 2, 3 }, new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

