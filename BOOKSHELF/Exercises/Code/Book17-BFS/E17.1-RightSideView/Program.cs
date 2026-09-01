//    1
//   / \
//  2   3
//   \   \
//    5   4
var root = new TreeNode(1,
    new TreeNode(2, null, new TreeNode(5)),
    new TreeNode(3, null, new TreeNode(4)));

try
{
    Console.WriteLine(string.Join(", ", Solution.RightSideView(root)));  // expect 1, 3, 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
