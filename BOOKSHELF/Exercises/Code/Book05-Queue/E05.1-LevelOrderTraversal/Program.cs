//      3
//     / \
//    9  20
//       / \
//      15  7
var root = new TreeNode(3,
    new TreeNode(9),
    new TreeNode(20, new TreeNode(15), new TreeNode(7)));

try
{
    foreach (var level in Solution.LevelOrder(root))
        Console.WriteLine($"[{string.Join(", ", level)}]");
    // expect [3] [9, 20] [15, 7]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
