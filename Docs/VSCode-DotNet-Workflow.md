# VS Code .NET Workflow

This repository uses .NET 8 and C# Dev Kit. Each exercise has its own project.

## Open the repository

From PowerShell:

```powershell
cd C:\Users\kixeye\source\repos\senior-csharp-dsa-interview
code .
```

Install these VS Code extensions if needed:

- C# Dev Kit by Microsoft
- C# by Microsoft

## Run an exercise

For example, E02.2:

```powershell
dotnet run --project .\BOOKSHELF\Exercises\Code\Book02-Dictionary\E02.2-FirstUniqueCharacter
```

This runs the exercise's `Program.cs` manual runner.

In VS Code:

- `Ctrl+F5` runs without debugging.
- `F5` runs with debugging.

## Build an exercise

```powershell
dotnet build .\BOOKSHELF\Exercises\Code\Book02-Dictionary\E02.2-FirstUniqueCharacter\E02.2-FirstUniqueCharacter.csproj
```

## Run all tests

```powershell
dotnet test .\BOOKSHELF\Exercises\Code\Book02-Dictionary\E02.2-FirstUniqueCharacter\E02.2-FirstUniqueCharacter.csproj --no-restore
```

For E09.5:

```powershell
dotnet test .\BOOKSHELF\Exercises\Code\Book09-TwoPointers\E09.5-SortColors\E09.5-SortColors.csproj --no-restore
```

Unfinished solutions intentionally throw `NotImplementedException`; their tests will fail until the solution is implemented.

## Run one test

Use the test class or method name with `--filter`:

```powershell
dotnet test .\BOOKSHELF\Exercises\Code\Book02-Dictionary\E02.2-FirstUniqueCharacter\E02.2-FirstUniqueCharacter.csproj --filter "FullyQualifiedName~FirstUniqueCharacterTests.FirstUniqChar_ReturnsSpecifiedIndex" --no-restore
```

## Run tests from VS Code

1. Open the **Testing** view from the left sidebar.
2. Wait for C# Dev Kit to discover the tests.
3. Expand the project and test class.
4. Select the play button beside a test or test class.
5. Select the bug icon beside a test to debug it.

You can also use the **Run Test** and **Debug Test** CodeLens links above each test.

## Debug an exercise

1. Open the exercise's `Program.cs`.
2. Click beside a line number to set a breakpoint.
3. Press `F5`.
4. Choose the exercise project if VS Code asks which project to launch.
5. Inspect variables in the **Variables** panel.

Useful controls:

- `F10`: step over
- `F11`: step into
- `Shift+F11`: step out
- `F5`: continue

## Debug a test

1. Open `Tests.cs` or the solution file.
2. Set a breakpoint in the test or in the method being tested.
3. Use **Debug Test** in CodeLens or the bug icon in the Testing view.
4. Inspect locals, call stack, and variables while the test is paused.

For parameterized xUnit tests, debug a specific test case from Test Explorer when you need to inspect one input.
