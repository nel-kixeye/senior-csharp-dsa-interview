public class ListNode
{
    public int val;
    public ListNode? next;
    public ListNode(int val = 0, ListNode? next = null) { this.val = val; this.next = next; }
}

public static class Solution
{
    // SINGLE pass, O(1) space. If there are two middles, return the SECOND.
    // Counting then walking again is two passes. What moves at two speeds?
    public static ListNode? MiddleNode(ListNode? head)
    {
        throw new NotImplementedException();
    }
}
