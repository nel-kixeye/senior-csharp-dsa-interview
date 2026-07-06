try
{
    var n5  = new TreeNode(5);
    var n1  = new TreeNode(1);
    var n6  = new TreeNode(6);
    var n2  = new TreeNode(2);
    var n0  = new TreeNode(0);
    var n8  = new TreeNode(8);
    var n7  = new TreeNode(7);
    var n4  = new TreeNode(4);
    n5.Left = n6; n5.Right = n1;
    n1.Left = n0; n1.Right = n8;
    n6.Left = n2; n6.Right = n4;
    n2.Left = n7;

    var lca = Solution.LowestCommonAncestor(n5, n6, n4);
    Console.WriteLine(lca.Val);
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}