public class ListNode
{
    public int val;
    public ListNode? next;
    public ListNode(int val = 0, ListNode? next = null) { this.val = val; this.next = next; }
}

public static class Solution
{
    // Iterative, O(n) time, O(1) space.
    // Name the one line that, in the wrong order, loses the rest of the list.
    // Return prev, NOT head - head is the tail once you are done.
    public static ListNode? ReverseList(ListNode? head)
    {
        throw new NotImplementedException();
    }

    // Follow-up: write it recursively too. What is the space complexity then?
}
