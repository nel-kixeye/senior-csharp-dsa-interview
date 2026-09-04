using Xunit;

public class CorpFlightBookingsTests
{
    [Fact]
    public void ExampleCase()
    {
        var actual = Solution.CorpFlightBookings(default, 1);        Assert.NotEqual(0, actual);
    }
}

