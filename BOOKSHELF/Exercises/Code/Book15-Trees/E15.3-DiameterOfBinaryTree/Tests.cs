using Xunit;

public class DiameterOfBinaryTreeTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.DiameterOfBinaryTree(null);        Assert.NotEqual(0, actual);
    }
}

