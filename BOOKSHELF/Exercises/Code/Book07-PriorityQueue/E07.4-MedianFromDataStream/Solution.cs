// AddNum in O(log n), FindMedian in O(1).
// ONE heap cannot do this. Two heaps let you see the boundary:
//   max-heap for the lower half, min-heap for the upper half.
// State the invariant you must restore after every insert.
public class MedianFinder
{
    public MedianFinder()
    {
        throw new NotImplementedException();
    }

    public void AddNum(int num) => throw new NotImplementedException();

    public double FindMedian() => throw new NotImplementedException();
}
