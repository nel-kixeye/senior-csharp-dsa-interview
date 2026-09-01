try
{
    var valid = new TreeNode(2, new TreeNode(1), new TreeNode(3));
    Console.WriteLine(Solution.IsValidBST(valid));

    var invalid = new TreeNode(5, new TreeNode(1), new TreeNode(4, new TreeNode(3), new TreeNode(6)));
    Console.WriteLine(Solution.IsValidBST(invalid));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}