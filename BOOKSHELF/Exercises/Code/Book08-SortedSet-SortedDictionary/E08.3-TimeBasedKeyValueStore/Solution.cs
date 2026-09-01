// Set(key, value, timestamp); Get(key, timestamp) returns the value with the
// LARGEST timestamp <= the requested one, or "" if none.
// Timestamps for a given key arrive STRICTLY INCREASING.
// That fact means you may not need a tree at all - what cheaper structure does
// it permit? Target: O(1) Set, O(log n) Get.
public class TimeMap
{
    public TimeMap()
    {
        throw new NotImplementedException();
    }

    public void Set(string key, string value, int timestamp) => throw new NotImplementedException();

    public string Get(string key, int timestamp) => throw new NotImplementedException();
}
