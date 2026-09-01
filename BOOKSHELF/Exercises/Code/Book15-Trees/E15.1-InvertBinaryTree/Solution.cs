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
    // Swap every node's left and right children. Return the root.
    //
    // Does the ORDER of "swap" versus "recurse" matter here? Answer yes or no
    // and say why - it is a good test of whether you understand traversal order.
    public static TreeNode? InvertTree(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
