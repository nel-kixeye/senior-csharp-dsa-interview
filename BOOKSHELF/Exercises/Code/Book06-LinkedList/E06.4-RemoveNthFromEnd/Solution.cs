public class ListNode
{
    public int val;
    public ListNode? next;
    public ListNode(int val = 0, ListNode? next = null) { this.val = val; this.next = next; }
}

public static class Solution
{
    // ONE pass, O(1) space.
    // Two pointers, one started ahead of the other. How far ahead?
    // Use a DUMMY HEAD - it removes the "deleting the first node" special case.
    public static ListNode? RemoveNthFromEnd(ListNode? head, int n)
    {
        throw new NotImplementedException();
    }
}
