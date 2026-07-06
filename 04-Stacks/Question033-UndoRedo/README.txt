Implement a simple Undo/Redo system using two stacks.

Implement UndoRedoStack:
- void Execute(string action)  performs and records an action
- string Undo()                undoes the last action, returns undone action (or "nothing" if empty)
- string Redo()                redoes the last undone action, returns action (or "nothing" if empty)

Restrictions:
- Use two stacks
- Executing a new action clears the redo stack
- Do not use LINQ