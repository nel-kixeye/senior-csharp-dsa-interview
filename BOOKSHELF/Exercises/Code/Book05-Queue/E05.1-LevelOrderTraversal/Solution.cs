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
    // Group node values level by level.
    // ONE line tells you where a level ends. Write it before anything else.
    public static IList<IList<int>> LevelOrder(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
