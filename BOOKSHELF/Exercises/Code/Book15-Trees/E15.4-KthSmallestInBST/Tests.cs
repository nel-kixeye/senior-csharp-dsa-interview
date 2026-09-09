using Xunit;

public class KthSmallestTests
{
    [Fact]
    public void ReturnsTheLeftmostValueForKOne()
    {
        var root = new TreeNode(5,
            new TreeNode(3, new TreeNode(1), new TreeNode(4)),
            new TreeNode(7));

        Assert.Equal(1, Solution.KthSmallest(root, 1));
    }

    [Fact]
    public void ReturnsTheRightmostValueForKEqualToNodeCount()
    {
        var root = new TreeNode(5,
            new TreeNode(3, new TreeNode(1), new TreeNode(4)),
            new TreeNode(7));

        Assert.Equal(7, Solution.KthSmallest(root, 5));
    }

    [Fact]
    public void HandlesRightSkewedTrees()
    {
        var root = new TreeNode(1, null, new TreeNode(2, null, new TreeNode(3)));

        Assert.Equal(2, Solution.KthSmallest(root, 2));
    }

    [Fact]
    public void HandlesNegativeAndExtremeValues()
    {
        var root = new TreeNode(0,
            new TreeNode(int.MinValue),
            new TreeNode(int.MaxValue));

        Assert.Equal(int.MinValue, Solution.KthSmallest(root, 1));
        Assert.Equal(int.MaxValue, Solution.KthSmallest(root, 3));
    }
}

