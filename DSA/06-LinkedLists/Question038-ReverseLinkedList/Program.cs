try
{
    var head = new ListNode(1, new ListNode(2, new ListNode(3, new ListNode(4, new ListNode(5)))));
    var result = Solution.ReverseList(head);
    for (var n = result; n != null; n = n.Next)
        Console.Write(n.Val + (n.Next != null ? " -> " : "\n"));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}