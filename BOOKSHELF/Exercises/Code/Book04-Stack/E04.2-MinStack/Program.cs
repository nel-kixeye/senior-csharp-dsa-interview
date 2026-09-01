try
{
    var st = new MinStack();
    st.Push(-2); st.Push(0); st.Push(-3);
    Console.WriteLine(st.GetMin());   // expect -3
    st.Pop();
    Console.WriteLine(st.Top());      // expect 0
    Console.WriteLine(st.GetMin());   // expect -2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
