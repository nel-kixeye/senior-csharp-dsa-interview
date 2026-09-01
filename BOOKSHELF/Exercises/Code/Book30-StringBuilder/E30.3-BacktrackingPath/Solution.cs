using System.Text;

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
    // All root-to-leaf paths as strings like "1->2->5".
    // Use a SINGLE StringBuilder rather than concatenating a new string at
    // every node.
    //
    // What is the O(1) "undo" for sb.Append(text)? Write it.
    // Then: what makes the undo tricky when the appended text has VARIABLE
    // length (a multi-digit number)?
    public static IList<string> BinaryTreePaths(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
