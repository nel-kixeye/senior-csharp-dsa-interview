using Xunit;

public class RightSideViewTests
{
    [Fact]
    public void EmptyTreeHasEmptyView()
    {
        Assert.Empty(Solution.RightSideView(null));
    }

    [Fact]
    public void ViewUsesTheLastNodeAtEachDepth()
    {
        var root = new TreeNode(1,
            new TreeNode(2, new TreeNode(5), null),
            new TreeNode(3, null, new TreeNode(4)));

        Assert.Equal([1, 3, 4], Solution.RightSideView(root));
    }

    [Fact]
    public void LeftSkewedTreeStillShowsEveryLevel()
    {
        var root = new TreeNode(1, new TreeNode(2, new TreeNode(3), null), null);

        Assert.Equal([1, 2, 3], Solution.RightSideView(root));
    }
}

