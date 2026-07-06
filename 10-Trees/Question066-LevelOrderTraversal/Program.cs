try
{
    var root = new TreeNode(3, new TreeNode(9), new TreeNode(20, new TreeNode(15), new TreeNode(7)));
    var result = Solution.LevelOrder(root);
    foreach (var level in result)
        Console.WriteLine(string.Join(", ", level));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}