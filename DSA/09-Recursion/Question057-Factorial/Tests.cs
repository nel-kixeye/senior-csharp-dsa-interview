using Xunit;

public class FactorialTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Factorial(1);        Assert.NotEqual(0, actual);
    }
}

