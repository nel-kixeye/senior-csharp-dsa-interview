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
    }
}
