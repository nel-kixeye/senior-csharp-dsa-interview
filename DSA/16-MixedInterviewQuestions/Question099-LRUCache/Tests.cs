using Xunit;

public class LRUCacheTests
{
    [Fact]
    public void LRUCache_UsesLeastRecentlyUsedEvictionPolicy()
    {
        var cache = new LRUCache(2);
        cache.Put(1, 1);
        cache.Put(2, 2);

        Assert.Equal(1, cache.Get(1));
        cache.Put(3, 3);
        Assert.Equal(-1, cache.Get(2));
        cache.Put(4, 4);
        Assert.Equal(-1, cache.Get(1));
        Assert.Equal(3, cache.Get(3));
        Assert.Equal(4, cache.Get(4));
    }

    [Fact]
    public void LRUCache_HandlesSingleCapacityAndReplacement()
    {
        var cache = new LRUCache(1);
        cache.Put(2, 1);
        Assert.Equal(1, cache.Get(2));

        cache.Put(3, 2);
        Assert.Equal(-1, cache.Get(2));
        Assert.Equal(2, cache.Get(3));
    }
}