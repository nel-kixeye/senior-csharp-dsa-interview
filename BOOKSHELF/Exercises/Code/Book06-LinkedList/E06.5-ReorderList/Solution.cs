public class ListNode
{
    public int val;
    public ListNode? next;
    public ListNode(int val = 0, ListNode? next = null) { this.val = val; this.next = next; }
}

public static class Solution
{
    // L0 -> L1 -> ... -> Ln-1 -> Ln   becomes   L0 -> Ln -> L1 -> Ln-1 -> ...
    // Rewire nodes; do NOT modify values. O(n) time, O(1) space.
    //
    // This is THREE exercises you have already done, chained.
    // Name all three before writing a line.
    // Watch: null-terminate the first half before reversing the second, or you
    // will build a cycle.
    public static void ReorderList(ListNode? head)
    {
        throw new NotImplementedException();
    }
}
