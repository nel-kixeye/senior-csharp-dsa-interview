//        5
//       / \
//      4   8
//     /   / \
//    11  13  4
//   / \     / \
//  7   2   5   1
var root = new TreeNode(5,
    new TreeNode(4, new TreeNode(11, new TreeNode(7), new TreeNode(2))),
    new TreeNode(8, new TreeNode(13), new TreeNode(4, new TreeNode(5), new TreeNode(1))));

try
{
    foreach (var p in Solution.PathSum(root, 22))
        Console.WriteLine($"[{string.Join(",", p)}]");
    // expect [5,4,11,2] and [5,8,4,5]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
