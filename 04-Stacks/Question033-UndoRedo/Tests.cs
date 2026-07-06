public static class Tests
{
    /*
     * Execute("A"), Execute("B"), Execute("C")
     * Undo() -> "C"
     * Undo() -> "B"
     * Redo() -> "B"
     * Execute("D")         -- redo stack cleared
     * Redo() -> "nothing"
     * Undo() -> "D"
     * Undo() -> "A"
     * Undo() -> "nothing"  (stack empty)
     */
}