try
{
    var root = new TreeNode(1, null, new TreeNode(2, new TreeNode(3)));
    var result = Solution.PostorderTraversal(root);
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}