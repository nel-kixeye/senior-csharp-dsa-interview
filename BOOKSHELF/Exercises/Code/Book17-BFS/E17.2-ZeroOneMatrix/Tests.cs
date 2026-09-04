using Xunit;

public class UpdateMatrixTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.UpdateMatrix(default);        Assert.NotEqual(0, actual);
    }
}

