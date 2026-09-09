using Xunit;

public class WallsAndGatesTests
{
    [Fact]
    public void FillsEachRoomWithDistanceToNearestGate()
    {
        var rooms = new[]
        {
            new[] { int.MaxValue, -1, 0, int.MaxValue },
            new[] { int.MaxValue, int.MaxValue, int.MaxValue, -1 },
            new[] { int.MaxValue, -1, int.MaxValue, -1 },
            new[] { 0, -1, int.MaxValue, int.MaxValue }
        };

        Solution.WallsAndGates(rooms);

        Assert.Equal(new[] { 3, -1, 0, 1 }, rooms[0]);
        Assert.Equal(new[] { 2, 2, 1, -1 }, rooms[1]);
        Assert.Equal(new[] { 1, -1, 2, -1 }, rooms[2]);
        Assert.Equal(new[] { 0, -1, 3, 4 }, rooms[3]);
    }

    [Fact]
    public void UnreachableRoomsRemainInfinite()
    {
        var rooms = new[] { new[] { int.MaxValue, -1, int.MaxValue } };

        Solution.WallsAndGates(rooms);

        Assert.Equal(new[] { int.MaxValue, -1, int.MaxValue }, rooms[0]);
    }
}

