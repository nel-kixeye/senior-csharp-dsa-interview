public static class Solution
{
    // For each, name the TYPE and one bug the WRONG choice would cause.
    // Record in Notes.txt, then declare the property you would actually write.
    //
    //  1. A user's date of birth.
    //  2. When an audit log entry was written.
    //  3. A store's daily opening time (09:00, every day).
    //  4. How long a request took to process.
    //  5. A subscription's expiry, for a service with users worldwide.
    //  6. A public holiday in a specific country.
    //  7. A meeting scheduled for "3pm Tokyo time next Tuesday".
    //
    // #7 IS THE HARD ONE. "Store UTC" is not a complete answer. Say why a
    // FUTURE scheduled local time differs from a PAST timestamp.

    public static object DateOfBirth() => throw new NotImplementedException();
    public static object AuditTimestamp() => throw new NotImplementedException();
    public static object OpeningTime() => throw new NotImplementedException();
    public static object RequestDuration() => throw new NotImplementedException();
    public static object SubscriptionExpiry() => throw new NotImplementedException();
}
