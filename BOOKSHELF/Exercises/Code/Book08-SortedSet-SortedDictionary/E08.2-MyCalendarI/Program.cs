try
{
    var c = new MyCalendar();
    Console.WriteLine(c.Book(10, 20));   // expect True
    Console.WriteLine(c.Book(15, 25));   // expect False (overlaps)
    Console.WriteLine(c.Book(20, 30));   // expect True  (touching is NOT overlapping)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
