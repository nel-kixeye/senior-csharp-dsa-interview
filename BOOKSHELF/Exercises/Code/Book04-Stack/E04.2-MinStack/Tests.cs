using Xunit;

public class MinStackTests
{
    [Fact]
    public void GetMin_AfterPushPopSequence_ReturnsCorrectMinimum()
    {
        var stack = new MinStack();
        stack.Push(-2);
        stack.Push(0);
        stack.Push(-3);

        Assert.Equal(-3, stack.GetMin());
        stack.Pop();
        Assert.Equal(0, stack.Top());
        Assert.Equal(-2, stack.GetMin());
    }

    [Fact]
    public void GetMin_WithDuplicateMinimums_TracksLatestMinimum()
    {
        var stack = new MinStack();
        stack.Push(1);
        stack.Push(1);

        Assert.Equal(1, stack.GetMin());
        stack.Pop();
        Assert.Equal(1, stack.GetMin());
    }

    [Fact]
    public void GetMin_AfterPoppingCurrentMinimum_UsesNextMinimum()
    {
        var stack = new MinStack();
        stack.Push(5);
        stack.Push(2);

        Assert.Equal(2, stack.GetMin());
        stack.Pop();
        Assert.Equal(5, stack.GetMin());
    }
}

