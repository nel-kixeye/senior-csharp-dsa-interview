using Xunit;

public class PartitionLabelsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.PartitionLabels("sample");        Assert.NotEqual(0, actual);
    }
}

