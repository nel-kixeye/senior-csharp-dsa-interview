using System.Globalization;

public static class Solution
{
    // A partner API sends timestamps in the FIXED format 2026-09-01T14:30:00Z.
    // Name THREE separate problems with this line, then rewrite it.
    public static DateTime Parse_Broken(string timestamp)
    {
        return DateTime.Parse(timestamp);
    }

    public static bool TryParseApiTimestamp(string input, out DateTimeOffset result)
        => throw new NotImplementedException();

    // The same partner also sends USER-ENTERED dates in a dd/MM/yyyy field.
    // What changes, and what must you NOT do?
    public static bool TryParseUserDate(string input, out DateOnly result)
        => throw new NotImplementedException();
}
