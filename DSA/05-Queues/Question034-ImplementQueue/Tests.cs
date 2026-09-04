using Xunit;

public class MyQueueTests
{
    [Fact]
    public void Queue_UsesFifoOrder()
    {
        var queue = new MyQueue();
        queue.Push(1);
        queue.Push(2);

        Assert.Equal(1, queue.Peek());
        Assert.Equal(1, queue.Pop());
        Assert.False(queue.Empty());
        Assert.Equal(2, queue.Pop());
        Assert.True(queue.Empty());
    }

    [Fact]
    public void Queue_ContinuesInOrderAcrossMultiplePushes()
    {
        var queue = new MyQueue();
        queue.Push(3);
        queue.Push(4);
        queue.Push(5);

        Assert.Equal(3, queue.Pop());
        Assert.Equal(4, queue.Pop());
        Assert.Equal(5, queue.Peek());
    }
}