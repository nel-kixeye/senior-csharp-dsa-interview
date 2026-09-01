static ListNode? Build(params int[] vals)
{
    ListNode? head = null;
    for (int i = vals.Length - 1; i >= 0; i--) head = new ListNode(vals[i], head);
    return head;
}

try
{
    Console.WriteLine(Solution.MiddleNode(Build(1, 2, 3, 4, 5))?.val);     // expect 3
    Console.WriteLine(Solution.MiddleNode(Build(1, 2, 3, 4, 5, 6))?.val);  // expect 4 (second middle)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
