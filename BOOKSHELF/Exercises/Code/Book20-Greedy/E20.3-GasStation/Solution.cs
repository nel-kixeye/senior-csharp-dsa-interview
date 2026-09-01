public static class Solution
{
    // n stations in a circle. gas[i] fuel available, cost[i] to reach the next.
    // Start with an empty tank. Return the starting index that completes the
    // circuit, or -1. The answer is unique if it exists.
    //
    // ONE PASS, O(1) space - no simulating from each candidate start.
    // Two insights to state before coding:
    //   1. When is the answer definitely -1?
    //   2. If you run dry between start and i, what do you know about EVERY
    //      index in between?
    public static int CanCompleteCircuit(int[] gas, int[] cost)
    {
        throw new NotImplementedException();
    }
}
