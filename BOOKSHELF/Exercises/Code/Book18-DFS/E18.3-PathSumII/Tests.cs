using Xunit;

public class PathSumTests
{
    [Fact]
    public void EmptyTreeHasNoPaths()
    {
        Assert.Empty(Solution.PathSum(null, 1));
    }

    [Fact]
    public void SingleNodeCanBeACompletePath()
    {
        var actual = Solution.PathSum(new TreeNode(5), 5);

        Assert.Equal([[5]], actual);
    }

    [Fact]
    public void OnlyRootToLeafPathsAreReturned()
    {
        var root = new TreeNode(1, new TreeNode(2), new TreeNode(3));

        Assert.Empty(Solution.PathSum(root, 3));
    }

    [Fact]
    public void SupportsNegativeValuesAndMultiplePaths()
    {
        var root = new TreeNode(5,
            new TreeNode(4, new TreeNode(11)),
            new TreeNode(8, null, new TreeNode(2)));

        Assert.Equal([[5, 4, 11], [5, 8, 2]], Solution.PathSum(root, 20));
    }
}

