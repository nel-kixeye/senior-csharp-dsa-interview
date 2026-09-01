public class TreeNode
{
    public int val;
    public TreeNode? left;
    public TreeNode? right;
    public TreeNode(int val = 0, TreeNode? left = null, TreeNode? right = null)
    {
        this.val = val; this.left = left; this.right = right;
    }
}

public static class Solution
{
    // The values visible when viewing the tree from the RIGHT - the rightmost
    // node at each depth.
    //
    // With the level-size snapshot, WHICH iteration of the inner loop produces
    // the answer for that level? One line.
    // Careful: a purely LEFT-skewed tree still has one visible node per level.
    public static IList<int> RightSideView(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
