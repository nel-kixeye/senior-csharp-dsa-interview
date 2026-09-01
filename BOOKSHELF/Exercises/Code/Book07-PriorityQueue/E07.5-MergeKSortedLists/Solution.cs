public class ListNode
{
    public int val;
    public ListNode? next;
    public ListNode(int val = 0, ListNode? next = null) { this.val = val; this.next = next; }
}

public static class Solution
{
    // Target: O(N log k) for N total nodes.
    // The heap holds one node per list - size k, NOT N.
    // Why is concatenate-then-sort worse? Say what information it discards.
    // Alternative worth knowing: divide and conquer, pairwise merging.
    public static ListNode? MergeKLists(ListNode?[] lists)
    {
        throw new NotImplementedException();
    }
}
