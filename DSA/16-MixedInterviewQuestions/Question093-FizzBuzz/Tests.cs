using Xunit;

public class FizzBuzzTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.FizzBuzz(1);        Assert.NotNull(actual);
    }
}

