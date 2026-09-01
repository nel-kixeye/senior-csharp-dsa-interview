public static class Solution
{
    // Each of the four below FAILS to compile (they are commented out so this
    // file builds). Uncomment them one at a time to see the error.
    //
    // ALL FOUR HAVE THE SAME UNDERLYING CAUSE. Name it ONCE in Notes.txt, then
    // say how each one manifests it, and give a fix.

    // --- A ---
    // class Parser { private ReadOnlySpan<char> _buffer; }

    // --- B ---
    // static async Task<int> CountAsync(ReadOnlySpan<char> text)
    // {
    //     await Task.Delay(1);
    //     return text.Length;
    // }

    // --- C ---
    // static IEnumerable<int> Lengths(ReadOnlySpan<char> s) { yield return s.Length; }

    // --- D ---
    // static Span<char> Build()
    // {
    //     Span<char> buf = stackalloc char[64];
    //     buf[0] = 'x';
    //     return buf;
    // }

    // Now write WORKING versions of B and D.
    public static Task<int> CountAsync(ReadOnlyMemory<char> text) => throw new NotImplementedException();

    public static char[] Build() => throw new NotImplementedException();
}
