# Running an exercise

Every exercise directory containing `Solution.cs` has its own .NET project.

```powershell
cd BOOKSHELF/Exercises/Code/Book01-HashSet/E01.1-ContainsDuplicate
dotnet run
dotnet test
```

`Program.cs` is a small manual runner. `Tests.cs` holds the exercise contract; converted xUnit tests appear in Visual Studio Code's C# Dev Kit Test Explorer and run with `dotnet test`.

The test projects deliberately reference the `Solution` in the same directory. No project shares another exercise's solution, so you can work through problems independently.

Unfinished solutions are intentionally left as `NotImplementedException`; their converted tests will fail until you implement the exercise yourself. This is expected and is useful feedback, not an infrastructure failure.
