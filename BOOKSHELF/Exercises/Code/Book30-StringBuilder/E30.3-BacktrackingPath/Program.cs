//    1
//   / \
//  2   3
//   \
//    5
var root = new TreeNode(1,
    new TreeNode(2, null, new TreeNode(5)),
    new TreeNode(3));

try
{
    foreach (var p in Solution.BinaryTreePaths(root)) Console.WriteLine(p);
    // expect  1->2->5  and  1->3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
