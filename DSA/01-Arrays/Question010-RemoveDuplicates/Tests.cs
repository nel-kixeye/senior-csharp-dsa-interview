using Xunit;

public class RemoveDuplicatesTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.RemoveDuplicates(new[] { 1, 2, 3 });        Assert.NotEqual(0, actual);
    }
}

