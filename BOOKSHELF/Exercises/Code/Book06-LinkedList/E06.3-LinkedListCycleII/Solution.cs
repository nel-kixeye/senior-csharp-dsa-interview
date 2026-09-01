public class ListNode
{
    public int val;
    public ListNode? next;
    public ListNode(int val = 0, ListNode? next = null) { this.val = val; this.next = next; }
}

public static class Solution
{
    // Return the node where the cycle BEGINS, or null if there is no cycle.
    // O(1) SPACE REQUIRED - a HashSet of visited nodes violates the constraint.
    // Detecting the cycle is the easy half. Finding the entry needs phase two:
    // after they meet, reset one pointer to head and advance BOTH by one.
    public static ListNode? DetectCycle(ListNode? head)
    {
        throw new NotImplementedException();
    }
}
