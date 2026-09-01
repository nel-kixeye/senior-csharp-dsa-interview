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
    // Valid BST: every node in the left subtree strictly SMALLER, right strictly
    // LARGER. O(n) time, O(height) space.
    //
    // The obvious approach compares each node to its PARENT. Before coding,
    // construct a tree where that returns the wrong answer. (Hint: 3 nodes is
    // not enough - you need a grandchild.)
    // Use long bounds so node values of int.MinValue/MaxValue do not break the
    // sentinels.
    public static bool IsValidBST(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
