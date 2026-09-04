using Xunit;

public class MyCalendarTests
{
    [Fact]
    public void Book_RejectsOverlappingAppointments()
    {
        var calendar = new MyCalendar();

        Assert.True(calendar.Book(10, 20));
        Assert.False(calendar.Book(15, 25));
        Assert.True(calendar.Book(20, 30));
    }

    [Fact]
    public void Book_AllowsTouchingEndpoints_ForHalfOpenRanges()
    {
        var calendar = new MyCalendar();

        Assert.True(calendar.Book(10, 20));
        Assert.True(calendar.Book(20, 30));
    }

    [Fact]
    public void Book_RejectsIdenticalAppointments()
    {
        var calendar = new MyCalendar();

        Assert.True(calendar.Book(10, 20));
        Assert.False(calendar.Book(10, 20));
    }
}

