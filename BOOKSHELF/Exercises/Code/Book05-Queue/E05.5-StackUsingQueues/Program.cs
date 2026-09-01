try
{
    var st = new MyStack();
    st.Push(1); st.Push(2);
    Console.WriteLine(st.Top());    // expect 2
    Console.WriteLine(st.Pop());    // expect 2
    Console.WriteLine(st.Empty());  // expect False
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
