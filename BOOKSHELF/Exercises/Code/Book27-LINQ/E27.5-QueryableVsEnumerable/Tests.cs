public static class Tests
{
    /*
     * 1. `a` -> the Where is part of the expression tree, so EF translates it:
     *        SELECT * FROM Orders WHERE Total > 100
     *    Only matching rows cross the wire.
     *
     *    `b` -> ToList() materializes the ENTIRE TABLE first, then filters in
     *    memory. On a large table this is the incident.
     *
     * 2. Add a projection BEFORE materializing:
     *        .Select(o => new { o.Id, o.Total })   ->  SELECT Id, Total
     *
     * 3. Calling a method EF cannot translate inside a Where (a custom C#
     *    helper, some string operations), or slipping in an AsEnumerable().
     *    Modern EF Core throws on unsupported client evaluation, but
     *    AsEnumerable() still opts out silently.
     *    Catch it by logging generated SQL in development and asserting on
     *    query counts in integration tests.
     *
     * Functional check: HighValue over the fake data returns ids 2 and 3.
     */
}
