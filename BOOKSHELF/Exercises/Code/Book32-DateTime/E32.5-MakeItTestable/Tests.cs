public static class Tests
{
    /*
     * WHY IT IS UNTESTABLE
     * DateTimeOffset.UtcNow is a STATIC, AMBIENT dependency. To test "expires in
     * 5 minutes" you would have to change the system clock or wait five minutes.
     * Boundary and DST cases are effectively untestable, and any test you do
     * write is time-dependent and flaky.
     *
     * THE TYPE: TimeProvider (.NET 8+).
     * Beyond an IClock, it also abstracts TIMERS and Task.Delay - so
     * FakeTimeProvider lets you test retry backoff, timeouts, and scheduled work
     * by ADVANCING VIRTUAL TIME instantly, not just answering "what time is it".
     *
     * Test Case 1  now one second BEFORE expiry -> false
     * Test Case 2  now EXACTLY at expiry        -> false  (the comparison is >)
     * Test Case 3  now one second AFTER expiry  -> true
     * Test Case 4  expiry far in the future     -> false
     * Test Case 5  with FakeTimeProvider, advance past expiry and re-check
     *              -> flips from false to true, deterministically
     */
}
