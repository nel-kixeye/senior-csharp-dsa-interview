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
    // ALL root-to-leaf paths whose values sum to targetSum.
    //
    // TWO traps:
    //   1. What exactly defines a LEAF? Be precise - a node with one child is not one.
    //   2. What must you do to the path list before adding it to the results?
    // Values may be negative, so you cannot prune on "sum already exceeded".
    public static IList<IList<int>> PathSum(TreeNode? root, int targetSum)
    {
        throw new NotImplementedException();
    }
}
