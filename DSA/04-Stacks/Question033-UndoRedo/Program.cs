try
{
    var ur = new UndoRedoStack();
    ur.Execute("type A");
    ur.Execute("type B");
    ur.Execute("type C");
    Console.WriteLine(ur.Undo());
    Console.WriteLine(ur.Undo());
    Console.WriteLine(ur.Redo());
    ur.Execute("type D");
    Console.WriteLine(ur.Redo());
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}