# Data Processing Interview Simulation

## Interview scenario

You are working on an internal reporting tool for a small commerce company. The company has exported order data from its order system and shipment events from a logistics provider. You must turn the raw exports into useful operational reports during a live coding interview.

You receive two files in the `data` folder:

- `orders.json` contains orders and nested order items.
- `shipment-events.csv` contains shipment events, including events for orders that may not appear in the order export.

The files are deliberately small enough to inspect quickly, but contain missing values, empty collections, invalid values, repeated records, events out of order, and records that should not contribute to every report.

## Starting point

The only source file supplied is `Program.cs`. It locates the data directory and reads the files as raw text. Everything else is your responsibility:

- Inspect the JSON and CSV structures.
- Decide what models you need.
- Deserialize and parse the files.
- Decide how malformed or missing values should be handled.
- Implement the four tasks below.
- Print useful results from `Program.cs` so you can inspect your work.

Do not hard-code answers from the sample files. Your code should operate on the loaded data.

## Task 1: Completed order report

Create a report for completed orders in a requested region.

For each matching order, return or print:

- Order ID
- Order date
- Number of valid items
- Total value after the order discount

A valid item has a product ID, a positive quantity, and a non-negative unit price. Ignore invalid items. A missing item collection behaves as having no valid items. Clamp discounts to the range from zero through one.

Sort the report by order date ascending, then order ID ascending. Cancelled, refunded, and other non-completed orders must not appear.

## Task 2: Customer spending report

Calculate the total completed-order spend for each customer.

Apply the same item validity and discount rules as Task 1. Include a customer whose valid total is zero. Ignore orders whose customer ID is missing or blank. Do not include cancelled, refunded, or partially fulfilled orders.

Return deterministic output, including when two customers have the same total. The report should work when there are no orders and when the input contains repeated records.

## Task 3: Product sales ranking

Produce a ranked report of the top `N` products sold through completed orders.

For every product, calculate:

- Product ID
- A usable product name
- Total quantity sold
- Total discounted revenue

Combine occurrences of the same product across all applicable orders. Invalid items do not contribute. When a product name is missing, use a sensible fallback. Apply each order's discount correctly when calculating revenue.

Sort by revenue descending, then quantity descending, then product ID ascending. A non-positive requested limit should produce no results. Ties must be handled deterministically.

This task is intended to make you consider how your data structures and number of passes affect runtime as the input grows.

## Task 4: Delayed shipment report

Find orders that were not delivered within a requested number of days after the order date.

Only consider orders with status `Completed` or `PartiallyFulfilled`. Match shipment events to orders. Shipment events may be out of order, duplicated, incomplete, or associated with an unknown order.

Ignore shipment events with a missing or invalid timestamp. A delivery exactly on the deadline is on time. An order with no valid delivery by the deadline is delayed. Return each delayed order ID once, sorted ascending.

Use a clear, consistent policy for a non-positive delivery window and for duplicate order records. Do not allow unknown shipment events to create delayed-order results.

## Constraints

- Time limit: 60 to 90 minutes.
- You may add types, methods, and small supporting files if you decide they are necessary, but begin with the supplied `Program.cs`.
- You may use the .NET standard library and normal JSON/CSV parsing techniques.
- Do not assume either file is sorted.
- Do not mutate the raw input while processing it.
- Preserve decimal precision for money.
- Keep behavior deterministic and explain important assumptions in your own notes or output.
- Prioritize working behavior and readable code over architecture.
- There are no supplied interviewer tests. Validate your work by inspecting outputs and creating your own temporary checks if needed.

## Suggested interview workflow

1. Run the program and inspect both raw files.
2. Sketch the data shape before writing processing logic.
3. Build the smallest useful models and loading code.
4. Complete Task 1 and inspect its output.
5. Complete Task 2, then Task 3.
6. Use the remaining time for Task 4, malformed data, empty input, and cleanup.

The goal is to practice the complete interview loop: receiving unfamiliar files, understanding their shape, building a workable representation, making reasonable assumptions, processing the data, and communicating results under time pressure.

## Running the simulation

From the repository root:

```powershell
dotnet run --project .\DataProcessingSim\DataProcessingSim.csproj
```

To use another folder containing `orders.json` and `shipment-events.csv`:

```powershell
dotnet run --project .\DataProcessingSim\DataProcessingSim.csproj -- C:\path\to\data
```
