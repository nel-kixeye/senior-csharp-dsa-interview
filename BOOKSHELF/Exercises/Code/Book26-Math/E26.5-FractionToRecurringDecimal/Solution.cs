public static class Solution
{
    // Return the fraction as a string. If the fractional part repeats, wrap the
    // repeating portion in parentheses.
    //   1/2   -> "0.5"
    //   2/3   -> "0.(6)"
    //   4/333 -> "0.(012)"
    //
    // You are doing LONG DIVISION by hand.
    // What tells you the decimal has started repeating, and what must you
    // remember to know WHERE the repeat began? That names the structure.
    //
    // OVERFLOW: numerator may be int.MinValue. Cast to long up front -
    // Math.Abs(int.MinValue) throws.
    public static string FractionToDecimal(int numerator, int denominator)
    {
        throw new NotImplementedException();
    }
}
