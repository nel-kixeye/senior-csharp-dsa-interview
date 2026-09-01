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
    return string.Join(" -> ", parts);
}

try
{
    Console.WriteLine(Show(Solution.ReverseList(Build(1, 2, 3, 4, 5))));  // expect 5 -> 4 -> 3 -> 2 -> 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
