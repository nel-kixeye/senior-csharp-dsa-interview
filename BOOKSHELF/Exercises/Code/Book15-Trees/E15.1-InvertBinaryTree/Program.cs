static TreeNode Sample()
{
    //      3
    //     / \
    //    9  20
    //       / \
    //      15  7
    return new TreeNode(3,
        new TreeNode(9),
        new TreeNode(20, new TreeNode(15), new TreeNode(7)));
}

static void Print(TreeNode? n)
{
    if (n == null) { Console.Write("null "); return; }
    Console.Write(n.val + " ");
    Print(n.left);
    Print(n.right);
}

try
{
    Print(Solution.InvertTree(Sample()));   // preorder of the inverted tree
    Console.WriteLine();
    // expect 3 20 7 null null 15 null null 9 null null
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
