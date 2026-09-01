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
    ListNode?[] lists = [Build(1, 4, 5), Build(1, 3, 4), Build(2, 6)];
    Console.WriteLine(Show(Solution.MergeKLists(lists)));  // expect 1 -> 1 -> 2 -> 3 -> 4 -> 4 -> 5 -> 6
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
