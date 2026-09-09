using Xunit;

public class FloodFillTests
{
    [Fact]
    public void RecolorsTheConnectedRegion()
    {
        var actual = Solution.FloodFill(
            [[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2);

        Assert.Equal(new[] { new[] { 2, 2, 2 }, new[] { 2, 2, 0 }, new[] { 2, 0, 1 } }, actual);
    }

    [Fact]
    public void SameColorDoesNotChangeTheImage()
    {
        var image = new[] { new[] { 0, 0 }, new[] { 0, 0 } };

        Assert.Equal(image, Solution.FloodFill(image, 0, 0, 0));
    }

    [Fact]
    public void IsolatedPixelCanBeFilled()
    {
        Assert.Equal(new[] { new[] { 2 } }, Solution.FloodFill([[1]], 0, 0, 2));
    }
}

