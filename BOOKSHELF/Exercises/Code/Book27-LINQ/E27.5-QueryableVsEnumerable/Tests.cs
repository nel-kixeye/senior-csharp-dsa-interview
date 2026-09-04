using Xunit;

public class QueryableVsEnumerableTests
{
    [Fact]
    public void HighValue_FiltersOutOrdersAtOrBelowThreshold()
    {
        IQueryable<Order> orders = new[]
        {
            new Order(1, 50m, "Alice"),
            new Order(2, 250m, "Bob"),
            new Order(3, 300m, "Charlie")
        }.AsQueryable();

        var actual = Solution.HighValue(orders).ToArray();

        Assert.Equal(new[] { (2, 250m), (3, 300m) }, actual);
    }
}
