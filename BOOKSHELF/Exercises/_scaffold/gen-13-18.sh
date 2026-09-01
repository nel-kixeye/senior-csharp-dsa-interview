#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
echo "Books 13-18"

TREE='public class TreeNode
{
    public int val;
    public TreeNode? left;
    public TreeNode? right;
    public TreeNode(int val = 0, TreeNode? left = null, TreeNode? right = null)
    {
        this.val = val; this.left = left; this.right = right;
    }
}
'

TREEHELP='static TreeNode Sample()
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
'

# ---------------------------------------------------------------- Book 13
B=Book13-Recursion; G=Book13-Recursion.md

start_exercise $B E13.1-MaximumDepth E13.1 $G Easy "Recursion / trees" "10 minutes"
{ echo "$TREE"; cat <<'EOF'
public static class Solution
{
    // Number of nodes along the longest root-to-leaf path.
    // State the recurrence in one sentence before coding:
    // "the depth of a node is ..."
    // Base case is null -> 0, NOT leaf -> 1. That handles one-sided nodes free.
    public static int MaxDepth(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
{ echo "$TREEHELP"; cat <<'EOF'
try
{
    Console.WriteLine(Solution.MaxDepth(Sample()));   // expect 3
    Console.WriteLine(Solution.MaxDepth(null));       // expect 0
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
} > "$DIR/Program.cs"
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  [3,9,20,null,null,15,7]  -> 3
     * Test Case 2  null                     -> 0
     * Test Case 3  [1]                      -> 1
     * Test Case 4  1 -> left 2 -> left 3    -> 3   (fully one-sided)
     * Test Case 5  1 with only a right child -> 2
     */
}
EOF
banner E13.1 "Maximum Depth of Binary Tree"

start_exercise $B E13.2-PowXN E13.2 $G Medium "Divide and conquer" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // x raised to the integer power n. O(log n) required, NOT O(n).
    //
    // TRAP: n can be int.MinValue, whose positive counterpart does not exist in
    // int. Math.Abs(int.MinValue) THROWS. Say how you will handle it before
    // writing - widen to long BEFORE negating.
    public static double MyPow(double x, int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.MyPow(2.0, 10));    // expect 1024
    Console.WriteLine(Solution.MyPow(2.0, -2));    // expect 0.25
    Console.WriteLine(Solution.MyPow(2.0, 0));     // expect 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  x = 2.0,  n = 10   -> 1024.0
     * Test Case 2  x = 2.0,  n = -2   -> 0.25
     * Test Case 3  x = 2.0,  n = 0    -> 1.0
     *
     * Test Case 4 - THE TRAP
     * Input:    x = 1.0, n = int.MinValue (-2147483648)
     * Expected: 1.0        (must not throw or overflow)
     *
     * Test Case 5 - negative base, odd exponent
     * Input:    x = -2.0, n = 3       -> -8.0
     */
}
EOF
banner E13.2 "Pow(x, n)"

start_exercise $B E13.3-MergeSort E13.3 $G Medium "Divide and conquer" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Implement merge sort. Do NOT call a library sort.
    // O(n log n) time, O(n) space, and it must be STABLE.
    //
    // Which comparison operator in the merge step is responsible for stability?
    // (< vs <= - one of them breaks it. Say which before you write it.)
    public static int[] MergeSort(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.MergeSort([5, 2, 9, 1, 5, 6])));
    // expect 1, 2, 5, 5, 6, 9
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { 5,2,9,1,5,6 }  -> { 1,2,5,5,6,9 }
     * Test Case 2  { }              -> { }
     * Test Case 3  { 1 }            -> { 1 }
     * Test Case 4  { 3,2,1 }        -> { 1,2,3 }   (reverse sorted)
     * Test Case 5  { 2,2,2 }        -> { 2,2,2 }   (all duplicates)
     *
     * STABILITY CHECK (do this one by hand):
     * Sort pairs by key only: (1,'a'), (0,'b'), (1,'c')
     * A stable sort gives (0,'b'), (1,'a'), (1,'c')  -- 'a' still before 'c'.
     */
}
EOF
banner E13.3 "Merge Sort"

start_exercise $B E13.4-NestedListWeightSum E13.4 $G Medium Recursion "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// A minimal stand-in for the nested structure.
public class NestedInteger
{
    private readonly int? _value;
    private readonly List<NestedInteger>? _list;

    public NestedInteger(int value) { _value = value; }
    public NestedInteger(List<NestedInteger> list) { _list = list; }

    public bool IsInteger() => _value.HasValue;
    public int GetInteger() => _value!.Value;
    public IList<NestedInteger> GetList() => _list!;
}

public static class Solution
{
    // Sum each integer multiplied by its DEPTH. Top level is depth 1.
    // [[1,1],2,[1,1]] -> 10
    //
    // What extra parameter does the recursive call need that the signature
    // does not hand you?
    public static int DepthSum(IList<NestedInteger> nestedList)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// [[1,1],2,[1,1]]
var input = new List<NestedInteger>
{
    new([new NestedInteger(1), new NestedInteger(1)]),
    new(2),
    new([new NestedInteger(1), new NestedInteger(1)])
};

try
{
    Console.WriteLine(Solution.DepthSum(input));   // expect 10
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  [[1,1],2,[1,1]]  -> 10   (1*2 + 1*2 + 2*1 + 1*2 + 1*2)
     * Test Case 2  [1,[4,[6]]]      -> 27   (1*1 + 4*2 + 6*3)
     * Test Case 3  []               -> 0    (empty)
     * Test Case 4  [[]]             -> 0    (list containing only an empty list)
     * Test Case 5  [5]              -> 5    (single integer at depth 1)
     */
}
EOF
banner E13.4 "Nested List Weight Sum"

start_exercise $B E13.5-LowestCommonAncestor E13.5 $G Medium "Recursion / trees" "25 minutes"
{ echo "$TREE"; cat <<'EOF'
public static class Solution
{
    // GENERAL binary tree (not a BST). Both p and q are guaranteed present.
    // A node may be its own ancestor. O(n) time, O(height) space.
    //
    // The solution is strikingly short. Two questions to answer first:
    //   - what should a node return when it finds p on the left and q on the right?
    //   - what should it return when it finds only ONE of them?
    public static TreeNode? LowestCommonAncestor(TreeNode? root, TreeNode p, TreeNode q)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
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
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Tree:      3
     *           / \
     *          5   1
     *         / \
     *        6   2
     *
     * Test Case 1  p = 5, q = 1  -> 3   (different subtrees)
     * Test Case 2  p = 5, q = 2  -> 5   (p IS the ancestor of q)
     * Test Case 3  p = 6, q = 2  -> 5   (siblings)
     * Test Case 4  p = q = 6     -> 6   (same node)
     * Test Case 5  p = 3, q = 6  -> 3   (root is the ancestor)
     */
}
EOF
banner E13.5 "Lowest Common Ancestor"

# ---------------------------------------------------------------- Book 14
B=Book14-Backtracking; G=Book14-Backtracking.md

start_exercise $B E14.1-Subsets E14.1 $G Medium Backtracking "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // All subsets (the power set) of DISTINCT integers, any order.
    // Target: O(n * 2^n) time.
    //
    // At each index you make ONE binary decision. Name it.
    // THE UNIVERSAL BUG: res.Add(cur) stores a reference you are about to
    // mutate. Always res.Add(new List<int>(cur)).
    //
    // Follow-up: solve it again with a bitmask loop and no recursion.
    public static IList<IList<int>> Subsets(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var all = Solution.Subsets([1, 2, 3]);
    Console.WriteLine($"count = {all.Count}");   // expect 8
    foreach (var s in all) Console.WriteLine($"[{string.Join(",", s)}]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { 1,2,3 }  -> 8 subsets: [], [1], [2], [3], [1,2], [1,3], [2,3], [1,2,3]
     * Test Case 2  { }        -> 1 subset:  [[]]
     * Test Case 3  { 0 }      -> 2 subsets: [], [0]
     * Test Case 4  { 1,2 }    -> 4 subsets
     *
     * Test Case 5 - COUNT CHECK: for n elements you must produce exactly 2^n
     * subsets, all distinct. If they are all empty or all identical, you added
     * the list by reference instead of copying it.
     */
}
EOF
banner E14.1 "Subsets"

start_exercise $B E14.2-Permutations E14.2 $G Medium Backtracking "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // All permutations of distinct integers. O(n * n!) time.
    //
    // Subsets used a START INDEX. Permutations need something different.
    // Which, and WHY does a start index not work here?
    public static IList<IList<int>> Permute(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var all = Solution.Permute([1, 2, 3]);
    Console.WriteLine($"count = {all.Count}");   // expect 6
    foreach (var p in all) Console.WriteLine($"[{string.Join(",", p)}]");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { 1,2,3 }  -> 6 permutations, all distinct
     * Test Case 2  { 1 }      -> 1 permutation:  [[1]]
     * Test Case 3  { 0,1 }    -> 2 permutations: [0,1], [1,0]
     * Test Case 4  { }        -> 1 permutation:  [[]]
     *
     * Test Case 5 - COUNT CHECK: exactly n! results, no duplicates.
     * For n = 4 that is 24.
     */
}
EOF
banner E14.2 "Permutations"

start_exercise $B E14.3-CombinationSum E14.3 $G Medium Backtracking "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Distinct positive candidates. Return all UNIQUE combinations summing to
    // target. THE SAME CANDIDATE MAY BE REUSED unlimited times.
    //
    // Reuse is allowed, so what index do you pass to the recursive call -
    // i or i + 1? Say which and why the other is wrong.
    // Prune: sort first, then stop the loop when a candidate exceeds what remains.
    public static IList<IList<int>> CombinationSum(int[] candidates, int target)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    foreach (var c in Solution.CombinationSum([2, 3, 6, 7], 7))
        Console.WriteLine($"[{string.Join(",", c)}]");
    // expect [2,2,3] and [7]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { 2,3,6,7 }, target 7 -> { {2,2,3}, {7} }
     * Test Case 2  { 2,3,5 },   target 8 -> { {2,2,2,2}, {2,3,3}, {3,5} }
     * Test Case 3  { 2 },       target 1 -> { }   (impossible)
     * Test Case 4  { 7 },       target 7 -> { {7} } (candidate equals target)
     *
     * Test Case 5 - NO REORDERED DUPLICATES
     * { 2,3 }, target 5 must yield {2,3} ONCE, never both {2,3} and {3,2}.
     */
}
EOF
banner E14.3 "Combination Sum"

start_exercise $B E14.4-WordSearch E14.4 $G Medium "Backtracking on a grid" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Does the word exist as a path of horizontally/vertically adjacent cells?
    // A cell may NOT be reused within a single word.
    //
    // How do you mark a cell in-use, and CRITICALLY - when do you unmark it?
    // Unmark on EVERY exit path, not just failure.
    public static bool Exist(char[][] board, string word)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
char[][] board =
[
    ['A','B','C','E'],
    ['S','F','C','S'],
    ['A','D','E','E']
];

try
{
    Console.WriteLine(Solution.Exist(board, "ABCCED"));  // expect True
    Console.WriteLine(Solution.Exist(board, "SEE"));     // expect True
    Console.WriteLine(Solution.Exist(board, "ABCB"));    // expect False (would reuse B)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Board:  A B C E
     *         S F C S
     *         A D E E
     *
     * Test Case 1  "ABCCED" -> true
     * Test Case 2  "SEE"    -> true
     *
     * Test Case 3 - REUSE must be rejected
     * Input:    "ABCB"      -> false
     *
     * Test Case 4 - single character present
     * Input:    "A"         -> true
     *
     * Test Case 5 - word longer than the grid
     * Input:    "ABCESEEEFSA...." (13+ chars) -> false
     */
}
EOF
banner E14.4 "Word Search"

start_exercise $B E14.5-NQueens E14.5 $G Hard "Backtracking + pruning" "40 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Place n queens on an n x n board with no two attacking. Return all
    // distinct solutions as board layouts ("....Q...." per row).
    //
    // One queen per row, so rows never conflict. Name the THREE remaining
    // conflict checks and make each O(1) rather than scanning the board.
    // Hint on the indices: cells on one diagonal share r + c; on the other,
    // r - c (offset to stay non-negative).
    public static IList<IList<string>> SolveNQueens(int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var sols = Solution.SolveNQueens(4);
    Console.WriteLine($"n=4 solutions: {sols.Count}");   // expect 2
    foreach (var board in sols)
    {
        foreach (var row in board) Console.WriteLine(row);
        Console.WriteLine();
    }
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * SOLUTION COUNTS - the best self-check for this problem:
     *
     * Test Case 1  n = 1  -> 1 solution
     * Test Case 2  n = 2  -> 0 solutions
     * Test Case 3  n = 3  -> 0 solutions
     * Test Case 4  n = 4  -> 2 solutions
     * Test Case 5  n = 8  -> 92 solutions
     *
     * If n = 8 gives anything other than 92, a diagonal check is wrong.
     */
}
EOF
banner E14.5 "N-Queens"

# ---------------------------------------------------------------- Book 15
B=Book15-Trees; G=Book15-Trees.md

start_exercise $B E15.1-InvertBinaryTree E15.1 $G Easy Trees "10 minutes"
{ echo "$TREE"; cat <<'EOF'
public static class Solution
{
    // Swap every node's left and right children. Return the root.
    //
    // Does the ORDER of "swap" versus "recurse" matter here? Answer yes or no
    // and say why - it is a good test of whether you understand traversal order.
    public static TreeNode? InvertTree(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
{ echo "$TREEHELP"; cat <<'EOF'
static void Print(TreeNode? n)
{
    if (n == null) { Console.Write("null "); return; }
    Console.Write(n.val + " ");
    Print(n.left);
    Print(n.right);
}

try
{
    Print(Solution.InvertTree(Sample()));   // preorder of the inverted tree
    Console.WriteLine();
    // expect 3 20 7 null null 15 null null 9 null null
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
} > "$DIR/Program.cs"
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  [4,2,7,1,3,6,9]  -> [4,7,2,9,6,3,1]
     * Test Case 2  null             -> null
     * Test Case 3  [1]              -> [1]
     * Test Case 4  [2,1,3]          -> [2,3,1]
     * Test Case 5  already symmetric [1,2,2] -> [1,2,2]
     */
}
EOF
banner E15.1 "Invert Binary Tree"

start_exercise $B E15.2-ValidateBST E15.2 $G Medium Trees "25 minutes"
{ echo "$TREE"; cat <<'EOF'
public static class Solution
{
    // Valid BST: every node in the left subtree strictly SMALLER, right strictly
    // LARGER. O(n) time, O(height) space.
    //
    // The obvious approach compares each node to its PARENT. Before coding,
    // construct a tree where that returns the wrong answer. (Hint: 3 nodes is
    // not enough - you need a grandchild.)
    // Use long bounds so node values of int.MinValue/MaxValue do not break the
    // sentinels.
    public static bool IsValidBST(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
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
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  [2,1,3]  -> true
     * Test Case 2  [5,1,4,null,null,3,6] -> false
     *
     * Test Case 3 - THE ONE THAT BREAKS PARENT-ONLY COMPARISON
     *          5
     *         / \
     *        1   6
     *           / \
     *          4   7        <- 4 is in the right subtree of 5 but LESS than 5
     * Expected: false       (every parent comparison passes)
     *
     * Test Case 4 - duplicates are invalid
     * Input:    [2,2]       -> false
     *
     * Test Case 5 - extreme values as node data
     * Input:    [int.MinValue] -> true    (must not fail on the sentinel)
     */
}
EOF
banner E15.2 "Validate Binary Search Tree"

start_exercise $B E15.3-DiameterOfBinaryTree E15.3 $G Medium "Trees / postorder" "25 minutes"
{ echo "$TREE"; cat <<'EOF'
public static class Solution
{
    // Longest path between ANY two nodes, measured in EDGES. It need not pass
    // through the root. O(n) time - NOT O(n^2).
    //
    // The naive version computes the height at every node, which is O(n^2).
    // What can a single postorder pass return that gives you both the height
    // AND lets you update the running answer?
    public static int DiameterOfBinaryTree(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
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
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  [1,2,3,4,5]  -> 3    (path 4-2-1-3, counted in EDGES)
     * Test Case 2  [1]          -> 0    (single node)
     * Test Case 3  [1,2]        -> 1
     *
     * Test Case 4 - longest path does NOT pass through the root
     *          1
     *         /
     *        2
     *       / \
     *      3   4
     *     /     \
     *    5       6
     * Expected: 4    (5-3-2-4-6)
     *
     * Test Case 5 - fully one-sided chain of 4 nodes -> 3
     */
}
EOF
banner E15.3 "Diameter of Binary Tree"

start_exercise $B E15.4-KthSmallestInBST E15.4 $G Medium "Trees / inorder" "25 minutes"
{ echo "$TREE"; cat <<'EOF'
public static class Solution
{
    // kth smallest value in a BST (1-indexed).
    // Target: O(height + k) - you should NOT visit all n nodes.
    //
    // Which traversal visits a BST in sorted order?
    // Then: how do you STOP EARLY at the kth rather than collecting all n?
    // (The iterative form makes early exit natural.)
    public static int KthSmallest(TreeNode? root, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
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
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * BST: 5 with left 3 (left 2 (left 1), right 4), right 6
     * Sorted order: 1, 2, 3, 4, 5, 6
     *
     * Test Case 1  k = 3  -> 3
     * Test Case 2  k = 1  -> 1   (leftmost)
     * Test Case 3  k = 6  -> 6   (rightmost, k = n)
     * Test Case 4  single node [1], k = 1 -> 1
     * Test Case 5  right-skewed 1->2->3, k = 2 -> 2
     */
}
EOF
banner E15.4 "Kth Smallest Element in a BST"

start_exercise $B E15.5-SerializeDeserialize E15.5 $G Hard "Trees / design" "35 minutes"
{ echo "$TREE"; cat <<'EOF'
public class Codec
{
    // Encode a binary tree to a string and decode it back.
    // NOT a BST - values may be any integer, including negative and multi-digit.
    //
    // Preorder alone cannot reconstruct a tree in general. What must you include
    // to make it work? Say it before coding.
    // Your delimiter must survive multi-digit and negative values.
    public string Serialize(TreeNode? root) => throw new NotImplementedException();

    public TreeNode? Deserialize(string data) => throw new NotImplementedException();
}
EOF
} > "$DIR/Solution.cs"
{ echo "$TREEHELP"; cat <<'EOF'
try
{
    var codec = new Codec();
    var original = Sample();
    var encoded = codec.Serialize(original);
    Console.WriteLine(encoded);

    var decoded = codec.Deserialize(encoded);
    Console.WriteLine(codec.Serialize(decoded));   // must equal the first line
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
} > "$DIR/Program.cs"
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * The self-check for all of these is a ROUND TRIP:
     *   Serialize(Deserialize(Serialize(t))) == Serialize(t)
     *
     * Test Case 1  [1,2,3,null,null,4,5]  round-trips
     * Test Case 2  null                   round-trips (empty tree)
     * Test Case 3  [1]                    round-trips (single node)
     * Test Case 4  fully left-skewed 1->2->3   round-trips
     *
     * Test Case 5 - NEGATIVE and MULTI-DIGIT values
     * Input:    [-100, 250, -3]
     * Expected: round-trips. If your delimiter is a single character that can
     *           appear in a value (like '-'), this is where it breaks.
     */
}
EOF
banner E15.5 "Serialize and Deserialize Binary Tree"

# ---------------------------------------------------------------- Book 16
B=Book16-Graphs; G=Book16-Graphs.md

start_exercise $B E16.1-NumberOfIslands E16.1 $G Medium "Graph / grid DFS" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Count islands of '1' connected 4-directionally.
    // O(rows * cols) time and space.
    //
    // Name TWO ways to mark a cell visited, and which uses no extra memory.
    // Note the tradeoff: one of them destroys the input.
    // Scale question: on a 300x300 all-land grid the recursion is 90,000 deep.
    public static int NumIslands(char[][] grid)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
char[][] grid =
[
    ['1','1','0','0','0'],
    ['1','1','0','0','0'],
    ['0','0','1','0','0'],
    ['0','0','0','1','1']
];

try
{
    Console.WriteLine(Solution.NumIslands(grid));   // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  the 4x5 grid in Program.cs        -> 3
     * Test Case 2  all '0'                           -> 0
     * Test Case 3  all '1' (3x3)                     -> 1
     *
     * Test Case 4 - DIAGONAL touching does NOT connect
     * Input:    { {'1','0'}, {'0','1'} }             -> 2
     *
     * Test Case 5  single cell '1'                   -> 1
     */
}
EOF
banner E16.1 "Number of Islands"

start_exercise $B E16.2-CloneGraph E16.2 $G Medium "Graph + Dictionary" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public class Node
{
    public int val;
    public IList<Node> neighbors;
    public Node(int val = 0) { this.val = val; neighbors = []; }
}

public static class Solution
{
    // Deep copy a connected undirected graph. It MAY CONTAIN CYCLES.
    //
    // Two books here. One traverses; the other prevents infinite recursion AND
    // ensures each original node maps to exactly one copy.
    // State the second one's exact key and value types.
    // Critical ordering detail: register the copy BEFORE recursing into
    // neighbours, or cycles will not terminate.
    public static Node? CloneGraph(Node? node)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// 1 -- 2
// |    |
// 4 -- 3
var n1 = new Node(1); var n2 = new Node(2);
var n3 = new Node(3); var n4 = new Node(4);
n1.neighbors = [n2, n4];
n2.neighbors = [n1, n3];
n3.neighbors = [n2, n4];
n4.neighbors = [n1, n3];

try
{
    var copy = Solution.CloneGraph(n1);
    Console.WriteLine(copy?.val);                              // expect 1
    Console.WriteLine(ReferenceEquals(copy, n1));              // expect False - it is a COPY
    Console.WriteLine(copy?.neighbors.Count);                  // expect 2
    Console.WriteLine(ReferenceEquals(copy?.neighbors[0], n2));// expect False
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  the 4-node cycle above - clone has the same shape, all new objects
     * Test Case 2  null input           -> null
     * Test Case 3  single node, no neighbours -> a new single node
     *
     * Test Case 4 - SELF LOOP
     * Node 1 whose neighbours include itself. The clone's neighbour must be the
     * CLONE, not the original.
     *
     * Test Case 5 - VERIFY IT IS A DEEP COPY
     * Mutate a neighbour list on the original after cloning; the clone must not
     * change. If it does, you returned references rather than copies.
     */
}
EOF
banner E16.2 "Clone Graph"

start_exercise $B E16.3-CourseSchedule E16.3 $G Medium "Graph / topological sort" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // prerequisites[i] = [a, b] means b must come before a.
    // Can all courses be finished? O(V + E).
    //
    // This is cycle detection on a DIRECTED graph. Name TWO algorithms that do
    // it, and say what each gives you BEYOND the yes/no answer.
    // With Kahn's: a cycle exists iff the produced order is shorter than
    // numCourses.
    public static bool CanFinish(int numCourses, int[][] prerequisites)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CanFinish(2, [[1, 0]]));           // expect True
    Console.WriteLine(Solution.CanFinish(2, [[1, 0], [0, 1]]));   // expect False (cycle)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  n = 2, { {1,0} }             -> true
     * Test Case 2  n = 2, { {1,0}, {0,1} }      -> false  (2-cycle)
     * Test Case 3  n = 3, { }                   -> true   (no prerequisites)
     *
     * Test Case 4 - SELF prerequisite
     * Input:    n = 1, { {0,0} }                -> false
     *
     * Test Case 5 - DISCONNECTED components, one with a cycle
     * Input:    n = 4, { {1,0}, {3,2}, {2,3} }  -> false
     */
}
EOF
banner E16.3 "Course Schedule"

start_exercise $B E16.4-PacificAtlantic E16.4 $G Medium "Graph / reverse traversal" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Pacific touches the top and left edges; Atlantic the bottom and right.
    // Water flows to a neighbour of EQUAL OR LOWER height.
    // Return all cells that can reach BOTH oceans.
    //
    // Searching outward from every cell is O((mn)^2).
    // What happens if you search BACKWARDS from the ocean edges instead - and
    // what does the height comparison become?
    public static IList<IList<int>> PacificAtlantic(int[][] heights)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int[][] heights =
[
    [1,2,2,3,5],
    [3,2,3,4,4],
    [2,4,5,3,1],
    [6,7,1,4,5],
    [5,1,1,2,4]
];

try
{
    foreach (var c in Solution.PacificAtlantic(heights))
        Console.Write($"[{c[0]},{c[1]}] ");
    Console.WriteLine();
    // expect [0,4] [1,3] [1,4] [2,2] [3,0] [3,1] [4,0]  (any order)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  the 5x5 grid above -> 7 cells:
     *              [0,4] [1,3] [1,4] [2,2] [3,0] [3,1] [4,0]
     *
     * Test Case 2 - single cell touches both oceans
     * Input:    { {1} }            -> { {0,0} }
     *
     * Test Case 3 - ALL EQUAL heights: every cell reaches both
     * Input:    3x3 of all 1s      -> all 9 cells
     *
     * Test Case 4 - single row (every cell touches top AND bottom)
     * Input:    { {1,2,3} }        -> all 3 cells
     *
     * Test Case 5 - single column
     * Input:    { {1},{2},{3} }    -> all 3 cells
     */
}
EOF
banner E16.4 "Pacific Atlantic Water Flow"

start_exercise $B E16.5-RedundantConnection E16.5 $G Medium "Union-Find" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // A tree with n nodes had ONE extra edge added, creating exactly one cycle.
    // Given the edges in order, return the LAST edge that can be removed to
    // restore a tree. The answer is guaranteed unique.
    //
    // You are processing edges one at a time asking "were these two ALREADY
    // connected?" That question names a structure which is neither BFS nor DFS.
    // Which one? Implement it with path compression.
    public static int[] FindRedundantConnection(int[][] edges)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.FindRedundantConnection([[1, 2], [1, 3], [2, 3]])));
    // expect 2, 3
    Console.WriteLine(string.Join(", ", Solution.FindRedundantConnection([[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]])));
    // expect 1, 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { {1,2},{1,3},{2,3} }               -> { 2, 3 }
     * Test Case 2  { {1,2},{2,3},{3,4},{1,4},{1,5} }   -> { 1, 4 }
     *
     * Test Case 3 - the redundant edge is the LAST one given
     * Input:    { {1,2},{2,3},{1,3} }                  -> { 1, 3 }
     *
     * Test Case 4 - smallest possible cycle (3 nodes)
     * Input:    { {1,2},{2,3},{1,3} }                  -> { 1, 3 }
     *
     * Test Case 5 - extra edge joins two DISTANT already-connected nodes
     * Input:    { {1,2},{2,3},{3,4},{4,5},{1,5} }      -> { 1, 5 }
     */
}
EOF
banner E16.5 "Redundant Connection"

# ---------------------------------------------------------------- Book 17
B=Book17-BFS; G=Book17-BFS.md

start_exercise $B E17.1-RightSideView E17.1 $G Medium "BFS / levels" "20 minutes"
{ echo "$TREE"; cat <<'EOF'
public static class Solution
{
    // The values visible when viewing the tree from the RIGHT - the rightmost
    // node at each depth.
    //
    // With the level-size snapshot, WHICH iteration of the inner loop produces
    // the answer for that level? One line.
    // Careful: a purely LEFT-skewed tree still has one visible node per level.
    public static IList<int> RightSideView(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
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
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  [1,2,3,null,5,null,4]  -> { 1, 3, 4 }
     * Test Case 2  null                   -> { }
     * Test Case 3  [1]                    -> { 1 }
     *
     * Test Case 4 - fully LEFT-skewed: every node is visible
     * Input:    1 -> left 2 -> left 3     -> { 1, 2, 3 }
     *
     * Test Case 5 - a left child at a depth where the right branch is shorter
     *          1
     *         / \
     *        2   3
     *       /
     *      4
     * Expected: { 1, 3, 4 }
     */
}
EOF
banner E17.1 "Binary Tree Right Side View"

start_exercise $B E17.2-ZeroOneMatrix E17.2 $G Medium "Multi-source BFS" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // For each cell, the distance to the nearest 0. At least one 0 is guaranteed.
    // Target: O(rows * cols) - a per-cell BFS would be O((rc)^2).
    //
    // Running a BFS from every 1 is too slow. FLIP IT.
    // What do you enqueue BEFORE the loop starts, and what does that give you
    // in a single pass? Name the technique.
    public static int[][] UpdateMatrix(int[][] mat)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int[][] mat = [[0, 0, 0], [0, 1, 0], [1, 1, 1]];

try
{
    foreach (var row in Solution.UpdateMatrix(mat))
        Console.WriteLine(string.Join(" ", row));
    // expect
    // 0 0 0
    // 0 1 0
    // 1 2 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1
     * Input:    { {0,0,0}, {0,1,0}, {1,1,1} }
     * Expected: { {0,0,0}, {0,1,0}, {1,2,1} }
     *
     * Test Case 2 - all zeroes
     * Input:    { {0,0} }          Expected: { {0,0} }
     *
     * Test Case 3 - a single 1 surrounded by zeroes
     * Input:    { {0,0,0}, {0,1,0}, {0,0,0} }
     * Expected: centre is 1
     *
     * Test Case 4 - a long run of 1s from one zero
     * Input:    { {0,1,1,1} }      Expected: { {0,1,2,3} }
     *
     * Test Case 5 - single row, zero at the far end
     * Input:    { {1,1,0} }        Expected: { {2,1,0} }
     */
}
EOF
banner E17.2 "01 Matrix"

start_exercise $B E17.3-WordLadder E17.3 $G Hard "BFS + HashSet" "40 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Shortest transformation sequence from beginWord to endWord, changing ONE
    // letter at a time, every intermediate word being in wordList.
    // Return the NUMBER OF WORDS in that sequence, or 0 if impossible.
    //
    // To find a word's neighbours, do NOT compare it against all N words.
    // What do you GENERATE instead, and what makes checking each candidate O(1)?
    // Why BFS and not DFS? Say it before coding.
    public static int LadderLength(string beginWord, string endWord, IList<string> wordList)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.LadderLength("hit", "cog",
        ["hot", "dot", "dog", "lot", "log", "cog"]));   // expect 5

    Console.WriteLine(Solution.LadderLength("hit", "cog",
        ["hot", "dot", "dog", "lot", "log"]));          // expect 0 (cog not in list)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1
     * begin "hit", end "cog", list { hot,dot,dog,lot,log,cog }
     * Expected: 5    (hit -> hot -> dot -> dog -> cog)
     *
     * Test Case 2 - endWord NOT in the list
     * Same but list { hot,dot,dog,lot,log }    Expected: 0
     *
     * Test Case 3 - one step apart
     * begin "a", end "c", list { a, b, c }     Expected: 2
     *
     * Test Case 4 - begin equals end
     * begin "hit", end "hit", list { hit }     Expected: 1
     *
     * Test Case 5 - no possible path
     * begin "hit", end "xyz", list { xyz }     Expected: 0
     */
}
EOF
banner E17.3 "Word Ladder"

start_exercise $B E17.4-ShortestPathBinaryMatrix E17.4 $G Medium "BFS / 8-directional" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Shortest CLEAR path from top-left to bottom-right through 0 cells,
    // moving 8-DIRECTIONALLY. Return -1 if none exists.
    //
    // Path length counts CELLS, not edges. What does that mean for your
    // starting step count? (This is the off-by-one that breaks the n=1 case.)
    // Guard the start and end cells before you begin.
    public static int ShortestPathBinaryMatrix(int[][] grid)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.ShortestPathBinaryMatrix([[0, 1], [1, 0]]));            // expect 2
    Console.WriteLine(Solution.ShortestPathBinaryMatrix([[0, 0, 0], [1, 1, 0], [1, 1, 0]])); // expect 4
    Console.WriteLine(Solution.ShortestPathBinaryMatrix([[1, 0], [0, 0]]));            // expect -1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { {0,1},{1,0} }                 -> 2   (diagonal move)
     * Test Case 2  { {0,0,0},{1,1,0},{1,1,0} }     -> 4
     *
     * Test Case 3 - START blocked
     * Input:    { {1,0},{0,0} }                    -> -1
     *
     * Test Case 4 - n = 1, the off-by-one case
     * Input:    { {0} }                            -> 1
     *
     * Test Case 5 - fully blocked end
     * Input:    { {0,0},{0,1} }                    -> -1
     */
}
EOF
banner E17.4 "Shortest Path in Binary Matrix"

start_exercise $B E17.5-WallsAndGates E17.5 $G Medium "Multi-source BFS" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Grid values: -1 = wall, 0 = gate, int.MaxValue = empty room.
    // Fill each empty room with the distance to its NEAREST gate, IN PLACE.
    // Rooms unreachable from any gate keep int.MaxValue.
    //
    // This is E17.2 wearing different clothes. Say in one sentence why they are
    // the same algorithm.
    public static void WallsAndGates(int[][] rooms)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
const int INF = int.MaxValue;
int[][] rooms =
[
    [INF, -1,   0, INF],
    [INF, INF, INF, -1 ],
    [INF, -1,  INF, -1 ],
    [  0, -1,  INF, INF]
];

try
{
    Solution.WallsAndGates(rooms);
    foreach (var row in rooms)
        Console.WriteLine(string.Join(" ", row.Select(v => v == INF ? "INF" : v.ToString())));
    // expect
    // 3 -1 0 1
    // 2 2 1 -1
    // 1 -1 2 -1
    // 0 -1 3 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  the 4x4 grid above ->
     *              3 -1  0  1
     *              2  2  1 -1
     *              1 -1  2 -1
     *              0 -1  3  4
     *
     * Test Case 2 - NO gates: grid is unchanged
     * Input:    { {INF, -1} }        Expected: unchanged
     *
     * Test Case 3 - no empty rooms
     * Input:    { {0, -1} }          Expected: unchanged
     *
     * Test Case 4 - a room walled off from every gate
     * Input:    { {0, -1, INF} }     Expected: { 0, -1, INF }  (stays INF)
     *
     * Test Case 5 - all gates
     * Input:    { {0, 0} }           Expected: unchanged
     */
}
EOF
banner E17.5 "Walls and Gates"

# ---------------------------------------------------------------- Book 18
B=Book18-DFS; G=Book18-DFS.md

start_exercise $B E18.1-FloodFill E18.1 $G Easy "DFS / grid" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Repaint the starting pixel and all 4-directionally connected pixels of the
    // same original colour.
    //
    // THE TRAP: what if newColor equals the original colour?
    // Name the guard, and say why the obvious "if (visited)" check is not what
    // saves you here.
    public static int[][] FloodFill(int[][] image, int sr, int sc, int color)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int[][] image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]];

try
{
    foreach (var row in Solution.FloodFill(image, 1, 1, 2))
        Console.WriteLine(string.Join(" ", row));
    // expect
    // 2 2 2
    // 2 2 0
    // 2 0 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1
     * Input:    { {1,1,1},{1,1,0},{1,0,1} }, sr=1, sc=1, color=2
     * Expected: { {2,2,2},{2,2,0},{2,0,1} }
     *
     * Test Case 2 - THE TRAP: new colour equals the old one
     * Input:    { {0,0},{0,0} }, sr=0, sc=0, color=0
     * Expected: unchanged, and it MUST TERMINATE (no infinite recursion)
     *
     * Test Case 3 - isolated starting pixel
     * Input:    { {0,1},{1,0} }, sr=0, sc=0, color=2   -> { {2,1},{1,0} }
     *
     * Test Case 4 - whole image one colour
     * Input:    { {1,1},{1,1} }, sr=0, sc=0, color=3   -> all 3
     *
     * Test Case 5 - 1x1 image
     * Input:    { {5} }, sr=0, sc=0, color=9           -> { {9} }
     */
}
EOF
banner E18.1 "Flood Fill"

start_exercise $B E18.2-MaxAreaOfIsland E18.2 $G Medium "DFS / grid" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Area of the LARGEST island (0 if none). 4-directional connectivity.
    //
    // E16.1 COUNTED islands; this one MEASURES them.
    // What does your recursive function need to RETURN now that it did not before?
    public static int MaxAreaOfIsland(int[][] grid)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int[][] grid =
[
    [0,0,1,0,0],
    [0,0,1,1,0],
    [0,1,0,0,0],
    [1,1,0,0,0]
];

try
{
    Console.WriteLine(Solution.MaxAreaOfIsland(grid));   // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  the grid above       -> 3
     * Test Case 2  all water            -> 0
     * Test Case 3  all land 3x3         -> 9
     * Test Case 4  two islands of equal size 2 -> 2
     * Test Case 5  single land cell     -> 1
     */
}
EOF
banner E18.2 "Max Area of Island"

start_exercise $B E18.3-PathSumII E18.3 $G Medium "DFS + backtracking" "25 minutes"
{ echo "$TREE"; cat <<'EOF'
public static class Solution
{
    // ALL root-to-leaf paths whose values sum to targetSum.
    //
    // TWO traps:
    //   1. What exactly defines a LEAF? Be precise - a node with one child is not one.
    //   2. What must you do to the path list before adding it to the results?
    // Values may be negative, so you cannot prune on "sum already exceeded".
    public static IList<IList<int>> PathSum(TreeNode? root, int targetSum)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
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
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  the tree above, target 22 -> { {5,4,11,2}, {5,8,4,5} }
     * Test Case 2  null root, target 0       -> { }
     * Test Case 3  [1], target 1             -> { {1} }
     *
     * Test Case 4 - the target is hit at an INTERNAL node, not a leaf
     *          1
     *         /
     *        2      target = 1
     * Expected: { }   (1 alone is not a root-to-LEAF path)
     *
     * Test Case 5 - NEGATIVE values (no early pruning possible)
     * Tree 1 -> left -2 -> left 3, target 2
     * Expected: { {1,-2,3} }
     */
}
EOF
banner E18.3 "Path Sum II"

start_exercise $B E18.4-SurroundedRegions E18.4 $G Medium "DFS / complement" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Capture every region of 'O' ENTIRELY surrounded by 'X' by flipping it to
    // 'X'. A region touching the border is NOT captured. Modify in place.
    //
    // Identifying surrounded regions directly is awkward. Identify the
    // COMPLEMENT instead - what is easy to find, and how do you use it?
    public static void Solve(char[][] board)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
char[][] board =
[
    ['X','X','X','X'],
    ['X','O','O','X'],
    ['X','X','O','X'],
    ['X','O','X','X']
];

try
{
    Solution.Solve(board);
    foreach (var row in board) Console.WriteLine(new string(row));
    // expect
    // XXXX
    // XXXX
    // XXXX
    // XOXX     <- the bottom O touches the border, so it survives
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  the 4x4 board above -> only the border-touching O survives
     *
     * Test Case 2 - ALL 'O': nothing is captured (all touch the border)
     * Input:    { {'O','O'},{'O','O'} }   Expected: unchanged
     *
     * Test Case 3 - all 'X'
     * Input:    { {'X'} }                 Expected: unchanged
     *
     * Test Case 4 - single row: nothing can be surrounded
     * Input:    { {'X','O','X'} }         Expected: unchanged
     *
     * Test Case 5 - a region connected to the border only via a CORNER cell
     * Must survive - connectivity is 4-directional, so verify carefully.
     */
}
EOF
banner E18.4 "Surrounded Regions"

start_exercise $B E18.5-LongestIncreasingPath E18.5 $G Hard "DFS + memoization" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Length of the longest STRICTLY INCREASING path, moving 4-directionally.
    // Target: O(rows * cols) - plain DFS from every cell is exponential.
    //
    // Two questions before coding:
    //   1. Why do you NOT need a visited set here? (It is a property of
    //      "strictly increasing" - say it.)
    //   2. What turns the exponential version into a linear one?
    public static int LongestIncreasingPath(int[][] matrix)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int[][] matrix = [[9, 9, 4], [6, 6, 8], [2, 1, 1]];

try
{
    Console.WriteLine(Solution.LongestIncreasingPath(matrix));   // expect 4 (1-2-6-9)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { {9,9,4},{6,6,8},{2,1,1} }  -> 4   (1 -> 2 -> 6 -> 9)
     * Test Case 2  { {3,4,5},{3,2,6},{2,2,1} }  -> 4   (3 -> 4 -> 5 -> 6)
     *
     * Test Case 3 - ALL EQUAL: no strictly increasing step exists
     * Input:    { {1,1},{1,1} }                 -> 1
     *
     * Test Case 4 - single cell
     * Input:    { {1} }                         -> 1
     *
     * Test Case 5 - single row, strictly increasing
     * Input:    { {1,2,3,4} }                   -> 4
     */
}
EOF
banner E18.5 "Longest Increasing Path in a Matrix"

echo "Books 13-18 done."
