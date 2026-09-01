//      1
//     / \
//    2   3
//   / \
//  4   5
var root = new TreeNode(1,
    new TreeNode(2, new TreeNode(4), new TreeNode(5)),
    new TreeNode(3));

try
{
    Console.WriteLine(Solution.DiameterOfBinaryTree(root));   // expect 3 (4-2-1-3)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
