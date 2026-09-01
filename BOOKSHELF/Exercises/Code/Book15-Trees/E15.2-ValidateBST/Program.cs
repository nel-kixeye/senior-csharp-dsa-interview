// VALID:      2            INVALID:   5
//            / \                     / \
//           1   3                   1   4      <- 4 is in the RIGHT subtree of 5
//                                      / \        but smaller than 5
//                                     3   6
var valid = new TreeNode(2, new TreeNode(1), new TreeNode(3));
var invalid = new TreeNode(5, new TreeNode(1),
                  new TreeNode(4, new TreeNode(3), new TreeNode(6)));

try
{
    Console.WriteLine(Solution.IsValidBST(valid));     // expect True
    Console.WriteLine(Solution.IsValidBST(invalid));   // expect False
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
