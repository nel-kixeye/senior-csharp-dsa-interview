try
{
    var head = new ListNode(1, new ListNode(2, new ListNode(3, new ListNode(4, new ListNode(5)))));
    var mid = Solution.MiddleNode(head);
    Console.WriteLine(mid.Val);
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}