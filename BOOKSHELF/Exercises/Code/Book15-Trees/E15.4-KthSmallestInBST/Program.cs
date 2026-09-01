//      5
//     / \
//    3   6
//   / \
//  2   4
// /
//1
var root = new TreeNode(5,
    new TreeNode(3, new TreeNode(2, new TreeNode(1)), new TreeNode(4)),
    new TreeNode(6));

try
{
    Console.WriteLine(Solution.KthSmallest(root, 3));   // expect 3
    Console.WriteLine(Solution.KthSmallest(root, 1));   // expect 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
