using Xunit;

public class ProductExceptSelfTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ProductExceptSelf(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

