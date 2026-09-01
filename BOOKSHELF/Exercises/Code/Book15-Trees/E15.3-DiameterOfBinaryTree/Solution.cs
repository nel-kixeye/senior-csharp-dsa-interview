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
    // Longest path between ANY two nodes, measured in EDGES. It need not pass
    // through the root. O(n) time - NOT O(n^2).
    //
    // The naive version computes the height at every node, which is O(n^2).
    // What can a single postorder pass return that gives you both the height
    // AND lets you update the running answer?
    public static int DiameterOfBinaryTree(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
