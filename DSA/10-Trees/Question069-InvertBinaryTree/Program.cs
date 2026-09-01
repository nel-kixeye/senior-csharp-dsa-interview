try
{
    var root = new TreeNode(4,
        new TreeNode(2, new TreeNode(1), new TreeNode(3)),
        new TreeNode(7, new TreeNode(6), new TreeNode(9)));
    var result = Solution.InvertTree(root);
    Console.WriteLine($"{result.Val}, {result.Left.Val}, {result.Right.Val}");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}