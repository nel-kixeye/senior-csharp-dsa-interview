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

public class Codec
{
    // Encode a binary tree to a string and decode it back.
    // NOT a BST - values may be any integer, including negative and multi-digit.
    //
    // Preorder alone cannot reconstruct a tree in general. What must you include
    // to make it work? Say it before coding.
    // Your delimiter must survive multi-digit and negative values.
    public string Serialize(TreeNode? root) => throw new NotImplementedException();

    public TreeNode? Deserialize(string data) => throw new NotImplementedException();
}
