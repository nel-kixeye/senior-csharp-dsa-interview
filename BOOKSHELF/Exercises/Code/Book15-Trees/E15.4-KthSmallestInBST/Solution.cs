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
    // kth smallest value in a BST (1-indexed).
    // Target: O(height + k) - you should NOT visit all n nodes.
    //
    // Which traversal visits a BST in sorted order?
    // Then: how do you STOP EARLY at the kth rather than collecting all n?
    // (The iterative form makes early exit natural.)
    public static int KthSmallest(TreeNode? root, int k)
    {
        throw new NotImplementedException();
    }
}
