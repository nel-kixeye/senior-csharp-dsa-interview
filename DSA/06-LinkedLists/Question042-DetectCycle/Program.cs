try
{
    var n3 = new ListNode(3);
    var n2 = new ListNode(2);
    var n0 = new ListNode(0);
    var n4 = new ListNode(-4);
    n3.Next = n2; n2.Next = n0; n0.Next = n4; n4.Next = n2; // cycle
    Console.WriteLine(Solution.HasCycle(n3));

    var noCycle = new ListNode(1, new ListNode(2));
    Console.WriteLine(Solution.HasCycle(noCycle));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}