using Xunit;

public class InvertTreeTests
{
    [Fact]
    public void NullTreeReturnsNull()
    {
        Assert.Null(Solution.InvertTree(null));
    }

    [Fact]
    public void LeafTreeIsUnchanged()
    {
        var root = new TreeNode(7);

        var actual = Solution.InvertTree(root);

        Assert.Same(root, actual);
        AssertTree(actual, 7, null, null);
    }

    [Fact]
    public void FullTreeSwapsEveryLevel()
    {
        var root = new TreeNode(4,
            new TreeNode(2, new TreeNode(1), new TreeNode(3)),
            new TreeNode(6, new TreeNode(5), new TreeNode(7)));

        var actual = Solution.InvertTree(root);

        Assert.Same(root, actual);
        AssertTree(actual, 4,
            new TreeNode(6, new TreeNode(7), new TreeNode(5)),
            new TreeNode(2, new TreeNode(3), new TreeNode(1)));
    }

    [Fact]
    public void OneSidedTreeSwapsMissingChildrenIntoTheOppositeSide()
    {
        var root = new TreeNode(1, new TreeNode(2, new TreeNode(3)), null);

        var actual = Solution.InvertTree(root);

        AssertTree(actual, 1, null, new TreeNode(2, null, new TreeNode(3)));
    }

    private static void AssertTree(TreeNode? actual, int expectedValue, TreeNode? expectedLeft, TreeNode? expectedRight)
    {
        Assert.NotNull(actual);
        Assert.Equal(expectedValue, actual.val);
        AssertTree(actual.left, expectedLeft);
        AssertTree(actual.right, expectedRight);
    }

    private static void AssertTree(TreeNode? actual, TreeNode? expected)
    {
        if (expected is null)
        {
            Assert.Null(actual);
            return;
        }

        Assert.NotNull(actual);
        Assert.Equal(expected.val, actual.val);
        AssertTree(actual.left, expected.left);
        AssertTree(actual.right, expected.right);
    }
}

