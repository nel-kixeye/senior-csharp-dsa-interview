static ListNode? Build(params int[] vals)
{
    ListNode? head = null;
    for (int i = vals.Length - 1; i >= 0; i--) head = new ListNode(vals[i], head);
    return head;
}

static string Show(ListNode? n)
{
    var parts = new List<string>();
    for (; n != null; n = n.next) parts.Add(n.val.ToString());
    return parts.Count == 0 ? "(empty)" : string.Join(" -> ", parts);
}

try
{
    Console.WriteLine(Show(Solution.RemoveNthFromEnd(Build(1, 2, 3, 4, 5), 2)));  // expect 1 -> 2 -> 3 -> 5
    Console.WriteLine(Show(Solution.RemoveNthFromEnd(Build(1), 1)));              // expect (empty)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
