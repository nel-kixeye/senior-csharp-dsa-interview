static ListNode? Build(params int[] vals)
{
    ListNode? head = null;
    for (int i = vals.Length - 1; i >= 0; i--) head = new ListNode(vals[i], head);
    return head;
}

static string Show(ListNode? n)
{
    var parts = new List<string>();
    for (int guard = 0; n != null && guard < 50; n = n.next, guard++) parts.Add(n.val.ToString());
    return string.Join(" -> ", parts);
}

try
{
    var a = Build(1, 2, 3, 4);
    Solution.ReorderList(a);
    Console.WriteLine(Show(a));   // expect 1 -> 4 -> 2 -> 3

    var b = Build(1, 2, 3, 4, 5);
    Solution.ReorderList(b);
    Console.WriteLine(Show(b));   // expect 1 -> 5 -> 2 -> 4 -> 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
