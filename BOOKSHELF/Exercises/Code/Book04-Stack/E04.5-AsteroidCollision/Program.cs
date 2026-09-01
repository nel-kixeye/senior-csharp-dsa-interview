try
{
    Console.WriteLine(string.Join(", ", Solution.AsteroidCollision([5, 10, -5])));  // expect 5, 10
    Console.WriteLine(string.Join(", ", Solution.AsteroidCollision([8, -8])));      // expect (empty)
    Console.WriteLine(string.Join(", ", Solution.AsteroidCollision([10, 2, -5])));  // expect 10
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
