using Xunit;

public class FibonacciTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.Fibonacci(1);        Assert.NotEqual(0, actual);
    }
}

