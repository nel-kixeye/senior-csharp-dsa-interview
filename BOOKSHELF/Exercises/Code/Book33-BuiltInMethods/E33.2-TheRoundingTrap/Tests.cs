public static class Tests
{
    /*
     * THE ANSWERS
     *   Math.Round(2.5)                            -> 2     (!)
     *   Math.Round(3.5)                            -> 4
     *   Math.Round(2.5, MidpointRounding.AwayFromZero) -> 3
     *   Math.Round(2.675, 2)                       -> 2.67  (!) binary representation
     *   (int)(2.7)                                 -> 2     truncation, not rounding
     *   Math.Floor(-2.1)                           -> -3
     *   (int)(-2.7)                                -> -2    truncates toward ZERO
     *
     * THE DEFAULT IS BANKER'S ROUNDING (round-half-to-even). It reduces
     * cumulative bias across many roundings, which is why it is the default, and
     * it surprises everyone the first time.
     *
     * CURRENCY: use DECIMAL, not double - 2.675 is not exactly representable in
     * binary floating point, which is why that line rounds "wrong". Then
     * Math.Round(amount, 2, MidpointRounding.AwayFromZero) if your domain
     * requires schoolbook rounding (many financial rules do - check which).
     *
     * Test Case  RoundMoney(2.675m) -> 2.68  (with decimal it works; with double it does not)
     */
}
