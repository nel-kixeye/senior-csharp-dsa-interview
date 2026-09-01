// A minimal stand-in for the nested structure.
public class NestedInteger
{
    private readonly int? _value;
    private readonly List<NestedInteger>? _list;

    public NestedInteger(int value) { _value = value; }
    public NestedInteger(List<NestedInteger> list) { _list = list; }

    public bool IsInteger() => _value.HasValue;
    public int GetInteger() => _value!.Value;
    public IList<NestedInteger> GetList() => _list!;
}

public static class Solution
{
    // Sum each integer multiplied by its DEPTH. Top level is depth 1.
    // [[1,1],2,[1,1]] -> 10
    //
    // What extra parameter does the recursive call need that the signature
    // does not hand you?
    public static int DepthSum(IList<NestedInteger> nestedList)
    {
        throw new NotImplementedException();
    }
}
