public static class Tests
{
    /*
     * Start: "leetcode.com"
     * Visit("google.com"), Visit("facebook.com"), Visit("youtube.com")
     * Back(1)    -> "facebook.com"
     * Back(1)    -> "google.com"
     * Forward(1) -> "facebook.com"
     * Visit("linkedin.com")  -- forward history cleared
     * Forward(2) -> "linkedin.com"  (can't go further)
     * Back(2)    -> "google.com"
     * Back(7)    -> "leetcode.com"  (clamped to beginning)
     */
}