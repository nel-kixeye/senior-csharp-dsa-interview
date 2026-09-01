// 3 -> 2 -> 0 -> -4
//      ^         |
//      +---------+
var n3 = new ListNode(3);
var n2 = new ListNode(2);
var n0 = new ListNode(0);
var n4 = new ListNode(-4);
n3.next = n2; n2.next = n0; n0.next = n4; n4.next = n2;   // cycle back to n2

try
{
    Console.WriteLine(Solution.DetectCycle(n3)?.val);          // expect 2
    Console.WriteLine(Solution.DetectCycle(new ListNode(1)));  // expect (blank / null)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
