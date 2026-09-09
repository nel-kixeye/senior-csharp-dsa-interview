using Xunit;

public class DiameterOfBinaryTreeTests
{
    [Fact]
    public void EmptyAndSingleNodeTreesHaveZeroDiameter()
    {
        Assert.Equal(0, Solution.DiameterOfBinaryTree(null));
        Assert.Equal(0, Solution.DiameterOfBinaryTree(new TreeNode(1)));
    }

    [Fact]
    public void DiameterCanPassThroughTheRoot()
    {
        var root = new TreeNode(1,
            new TreeNode(2, new TreeNode(4), new TreeNode(5)),
            new TreeNode(3));

        Assert.Equal(3, Solution.DiameterOfBinaryTree(root));
    }

    [Fact]
    public void DiameterNeedNotPassThroughTheRoot()
    {
        var root = new TreeNode(1,
            new TreeNode(2,
                new TreeNode(4, new TreeNode(8), new TreeNode(9)),
                new TreeNode(5)),
            new TreeNode(3));

        Assert.Equal(4, Solution.DiameterOfBinaryTree(root));
    }

    [Fact]
    public void OneSidedTreeCountsEdgesNotNodes()
    {
        var root = new TreeNode(1, new TreeNode(2, new TreeNode(3, new TreeNode(4))), null);

        Assert.Equal(3, Solution.DiameterOfBinaryTree(root));
    }
}

