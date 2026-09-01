// 1 -- 2
// |    |
// 4 -- 3
var n1 = new Node(1); var n2 = new Node(2);
var n3 = new Node(3); var n4 = new Node(4);
n1.neighbors = [n2, n4];
n2.neighbors = [n1, n3];
n3.neighbors = [n2, n4];
n4.neighbors = [n1, n3];

try
{
    var copy = Solution.CloneGraph(n1);
    Console.WriteLine(copy?.val);                              // expect 1
    Console.WriteLine(ReferenceEquals(copy, n1));              // expect False - it is a COPY
    Console.WriteLine(copy?.neighbors.Count);                  // expect 2
    Console.WriteLine(ReferenceEquals(copy?.neighbors[0], n2));// expect False
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
