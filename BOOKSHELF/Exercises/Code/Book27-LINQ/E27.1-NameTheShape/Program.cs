var users = new List<User> { new(1, "A", "Eng"), new(2, "B", "Eng"), new(3, "C", "Sales") };
var employees = new List<Employee> { new("A", 100), new("B", 250), new("C", 180) };

try
{
    Console.WriteLine(string.Join(", ", Solution.Departments(users)));   // expect Eng, Sales
    Console.WriteLine(Solution.TopEarner(employees)?.Name);              // expect B
    Console.WriteLine(Solution.Batches(Enumerable.Range(1, 1200)).Count());// expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
