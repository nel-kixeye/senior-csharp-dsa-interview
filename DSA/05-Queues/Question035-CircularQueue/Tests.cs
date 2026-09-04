using Xunit;

public class CircularQueueTests
{
    [Fact]
    public void CircularQueue_EnqueuesAndDequeuesAroundTheBuffer()
    {
        var queue = new CircularQueue(3);
        Assert.True(queue.Enqueue(1));
        Assert.True(queue.Enqueue(2));
        Assert.True(queue.Enqueue(3));
        Assert.False(queue.Enqueue(4));
        Assert.Equal(3, queue.Rear());
        Assert.True(queue.IsFull());

        Assert.True(queue.Dequeue());
        Assert.True(queue.Enqueue(4));
        Assert.Equal(4, queue.Rear());
    }
}