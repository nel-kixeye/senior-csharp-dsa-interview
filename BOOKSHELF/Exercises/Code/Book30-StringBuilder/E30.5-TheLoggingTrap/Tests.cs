public static class Tests
{
    /*
     * WHAT HAPPENS
     * The interpolated string is built EAGERLY, before LogDebug is called. So
     * you pay the formatting, the allocation, and the customer.Name property
     * access even though the message is immediately discarded. On a hot path
     * that is pure waste.
     *
     * CORRECT FORM
     *   logger.LogDebug("Processing order {OrderId} for customer {CustomerName} with {ItemCount} items",
     *                   order.Id, customer.Name, order.Items.Count);
     * The template and arguments are passed separately; formatting happens only
     * if the level is enabled.
     * (.NET 6+ interpolated-string handlers make LogDebug($"...") lazy too - but
     * the template form is still preferred, for the reason below.)
     *
     * THE SECOND BENEFIT: STRUCTURED LOGGING.
     * The arguments are captured as NAMED FIELDS, so your log platform can index
     * and query on OrderId rather than regex-matching a flat string. That is
     * worth more than the performance.
     *
     * Test Case  Run Program.cs. The broken call performs the interpolation even
     * with IsDebugEnabled == false; yours must not.
     */
}
