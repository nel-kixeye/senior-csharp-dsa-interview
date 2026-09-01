//        3
//       / \
//      5   1
//     / \
//    6   2
var n6 = new TreeNode(6);
var n2 = new TreeNode(2);
var n5 = new TreeNode(5, n6, n2);
var n1 = new TreeNode(1);
var root = new TreeNode(3, n5, n1);

try
{
    Console.WriteLine(Solution.LowestCommonAncestor(root, n5, n1)?.val);  // expect 3
    Console.WriteLine(Solution.LowestCommonAncestor(root, n5, n2)?.val);  // expect 5 (self-ancestor)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
