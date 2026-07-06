try
{
    var l1 = new ListNode(1, new ListNode(2, new ListNode(4)));
    var l2 = new ListNode(1, new ListNode(3, new ListNode(4)));
    var result = Solution.MergeTwoLists(l1, l2);
    for (var n = result; n != null; n = n.Next)
        Console.Write(n.Val + (n.Next != null ? " -> " : "\n"));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}