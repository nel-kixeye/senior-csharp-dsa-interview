static TreeNode Sample()
{
    //      3
    //     / \
    //    9  20
    //       / \
    //      15  7
    return new TreeNode(3,
        new TreeNode(9),
        new TreeNode(20, new TreeNode(15), new TreeNode(7)));
}

try
{
    var codec = new Codec();
    var original = Sample();
    var encoded = codec.Serialize(original);
    Console.WriteLine(encoded);

    var decoded = codec.Deserialize(encoded);
    Console.WriteLine(codec.Serialize(decoded));   // must equal the first line
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
