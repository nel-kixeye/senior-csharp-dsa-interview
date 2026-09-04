using Xunit;

public class UndoRedoStackTests
{
    [Fact]
    public void UndoRedo_TracksHistoryAndRedoStack()
    {
        var stack = new UndoRedoStack();
        stack.Execute("A");
        stack.Execute("B");
        stack.Execute("C");

        Assert.Equal("C", stack.Undo());
        Assert.Equal("B", stack.Undo());
        Assert.Equal("B", stack.Redo());

        stack.Execute("D");
        Assert.Equal(string.Empty, stack.Redo());
        Assert.Equal("D", stack.Undo());
        Assert.Equal("A", stack.Undo());
        Assert.Equal(string.Empty, stack.Undo());
    }
}