try
{
    var root = new TreeNode(3, new TreeNode(9), new TreeNode(20, new TreeNode(15), new TreeNode(7)));
    Console.WriteLine(Solution.MaxDepth(root));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}