using Xunit;

public class IsValidBSTTests
{
    [Fact]
    public void EmptyAndSingleNodeTreesAreValid()
    {
        Assert.True(Solution.IsValidBST(null));
        Assert.True(Solution.IsValidBST(new TreeNode(8)));
    }

    [Fact]
    public void ValidTreeAcceptsExtremeValues()
    {
        var root = new TreeNode(0,
            new TreeNode(int.MinValue),
            new TreeNode(int.MaxValue));

        Assert.True(Solution.IsValidBST(root));
    }

    [Fact]
    public void DuplicateValuesAreInvalid()
    {
        Assert.False(Solution.IsValidBST(new TreeNode(5, new TreeNode(5), null)));
        Assert.False(Solution.IsValidBST(new TreeNode(5, null, new TreeNode(5))));
    }

    [Fact]
    public void DeepValueMustRespectAllAncestorBounds()
    {
        var root = new TreeNode(10,
            new TreeNode(5, null, new TreeNode(12)),
            new TreeNode(15));

        Assert.False(Solution.IsValidBST(root));
    }
}

