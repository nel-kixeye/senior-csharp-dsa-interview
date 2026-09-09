using Xunit;

public class CodecTests
{
    [Fact]
    public void SerializeDeserialize_RoundTripsTypicalTree()
    {
        var root = new TreeNode(1,
            new TreeNode(2),
            new TreeNode(3, new TreeNode(4), new TreeNode(5)));

        var codec = new Codec();
        var serialized = codec.Serialize(root);
        var deserialized = codec.Deserialize(serialized);

        Assert.Equal(serialized, codec.Serialize(deserialized));
        AssertTreeEqual(root, deserialized);
    }

    [Fact]
    public void SerializeDeserialize_RoundTripsNullTree()
    {
        var codec = new Codec();
        Assert.Equal(string.Empty, codec.Serialize(null));
        Assert.Null(codec.Deserialize(string.Empty));
    }

    [Fact]
    public void SerializeDeserialize_RoundTripsNegativeAndMultiDigitValues()
    {
        var root = new TreeNode(-100,
            new TreeNode(250),
            new TreeNode(-3));

        var codec = new Codec();
        var serialized = codec.Serialize(root);
        var deserialized = codec.Deserialize(serialized);

        Assert.Equal(serialized, codec.Serialize(deserialized));
        AssertTreeEqual(root, deserialized);
    }

    [Fact]
    public void SerializeDeserialize_PreservesOneSidedShape()
    {
        var root = new TreeNode(10,
            null,
            new TreeNode(-2, new TreeNode(7), null));

        var codec = new Codec();
        var deserialized = codec.Deserialize(codec.Serialize(root));

        AssertTreeEqual(root, deserialized);
    }

    private static void AssertTreeEqual(TreeNode? expected, TreeNode? actual)
    {
        if (expected is null)
        {
            Assert.Null(actual);
            return;
        }

        Assert.NotNull(actual);
        Assert.Equal(expected.val, actual.val);
        AssertTreeEqual(expected.left, actual.left);
        AssertTreeEqual(expected.right, actual.right);
    }
}
