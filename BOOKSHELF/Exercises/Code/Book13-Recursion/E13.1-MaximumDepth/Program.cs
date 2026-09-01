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

try
{
    Console.WriteLine(Solution.MaxDepth(Sample()));   // expect 3
    Console.WriteLine(Solution.MaxDepth(null));       // expect 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
