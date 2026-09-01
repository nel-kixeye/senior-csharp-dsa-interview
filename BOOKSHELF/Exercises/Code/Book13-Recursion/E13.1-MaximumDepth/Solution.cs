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
    // Number of nodes along the longest root-to-leaf path.
    // State the recurrence in one sentence before coding:
    // "the depth of a node is ..."
    // Base case is null -> 0, NOT leaf -> 1. That handles one-sided nodes free.
    public static int MaxDepth(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
