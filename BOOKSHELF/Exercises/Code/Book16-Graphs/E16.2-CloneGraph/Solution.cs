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
