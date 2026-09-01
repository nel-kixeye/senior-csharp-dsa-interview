public static class Solution
{
    // bookings[i] = [first, last, seats] means `seats` were reserved on EVERY
    // flight in the inclusive range. Return total seats per flight (1..n).
    //
    // The nested loop is 2*10^4 * 2*10^4 = 4*10^8 operations. Too slow.
    // You are applying many RANGE UPDATES and reading the array ONCE at the end.
    // Name the technique and the two lines it needs per booking.
    // Size the array n + 1 so diff[last] is always in range. Use long.
    public static int[] CorpFlightBookings(int[][] bookings, int n)
    {
        throw new NotImplementedException();
    }
}
