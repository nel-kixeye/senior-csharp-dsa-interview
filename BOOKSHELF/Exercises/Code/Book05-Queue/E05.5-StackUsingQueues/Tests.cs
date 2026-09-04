using Xunit;

public class MyStackTests
{
    [Fact]
    public void Stack_UsesLifoOrder()
    {
        var stack = new MyStack();
        stack.Push(1);
        stack.Push(2);

        Assert.Equal(2, stack.Top());
        Assert.Equal(2, stack.Pop());
        Assert.False(stack.Empty());
    }

    [Fact]
    public void Stack_PushThenPopImmediately_EmptiesStack()
    {
        var stack = new MyStack();
        stack.Push(5);

        Assert.Equal(5, stack.Pop());
        Assert.True(stack.Empty());
    }

    [Fact]
    public void Stack_InterleavedOperations_WorkCorrectly()
    {
        var stack = new MyStack();
        stack.Push(1);
        Assert.Equal(1, stack.Pop());

        stack.Push(2);
        stack.Push(3);
        Assert.Equal(3, stack.Pop());
        Assert.Equal(2, stack.Top());
    }
}

