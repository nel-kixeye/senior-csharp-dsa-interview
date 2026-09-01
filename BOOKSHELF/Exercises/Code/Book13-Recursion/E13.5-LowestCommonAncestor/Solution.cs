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
    // GENERAL binary tree (not a BST). Both p and q are guaranteed present.
    // A node may be its own ancestor. O(n) time, O(height) space.
    //
    // The solution is strikingly short. Two questions to answer first:
    //   - what should a node return when it finds p on the left and q on the right?
    //   - what should it return when it finds only ONE of them?
    public static TreeNode? LowestCommonAncestor(TreeNode? root, TreeNode p, TreeNode q)
    {
        throw new NotImplementedException();
    }
}
