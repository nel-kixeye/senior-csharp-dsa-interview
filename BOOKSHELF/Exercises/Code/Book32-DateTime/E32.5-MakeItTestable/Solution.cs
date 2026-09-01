public record Subscription(int Id, DateTimeOffset ExpiresAt);

public static class Solution
{
    // THIS IS CORRECT AND UNTESTABLE.
    //
    // In Notes.txt, explain why you cannot write a reliable unit test for the
    // boundary, for DST behaviour, or for "expires in 5 minutes" logic.
    public static bool IsExpired_Broken(Subscription sub) => DateTimeOffset.UtcNow > sub.ExpiresAt;

    // Fix 1: pass the current time in.
    public static bool IsExpired(Subscription sub, DateTimeOffset now)
        => throw new NotImplementedException();

    // Fix 2: inject a clock.
    public static bool IsExpired(Subscription sub, TimeProvider timeProvider)
        => throw new NotImplementedException();

    // Then: name the .NET 8+ type built for exactly this, and ONE thing it gives
    // you beyond a hand-rolled IClock.
}
