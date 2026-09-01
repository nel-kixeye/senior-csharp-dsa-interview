using System.Buffers;

public static class Solution
{
    // 10,000 messages/second, each needing a temporary 64 KB byte[].
    public static int Process_Broken(ReadOnlySpan<byte> message)
    {
        var buffer = new byte[65536];
        message.CopyTo(buffer);
        return buffer.Length;
    }

    // Rewrite with ArrayPool<byte>.Shared.
    //
    // THREE things you must get right - answer in Notes.txt before coding:
    //   - one about the returned array's SIZE
    //   - one about its CONTENTS
    //   - one about WHEN you give it back
    //
    // Then: why does 64 KB matter specifically? What threshold is it near, and
    // what changes above that threshold?
    public static int Process(ReadOnlySpan<byte> message) => throw new NotImplementedException();
}
