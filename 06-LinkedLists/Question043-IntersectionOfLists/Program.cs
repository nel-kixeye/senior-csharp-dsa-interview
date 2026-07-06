try
{
    var shared = new ListNode(8, new ListNode(4, new ListNode(5)));
    var headA = new ListNode(4, new ListNode(1, shared));
    var headB = new ListNode(5, new ListNode(6, new ListNode(1, shared)));
    var result = Solution.GetIntersectionNode(headA, headB);
    Console.WriteLine(result?.Val ?? -1);
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}