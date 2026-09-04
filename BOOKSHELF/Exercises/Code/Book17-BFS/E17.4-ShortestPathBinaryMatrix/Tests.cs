using Xunit;

public class ShortestPathBinaryMatrixTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.ShortestPathBinaryMatrix(default);        Assert.NotEqual(0, actual);
    }
}

