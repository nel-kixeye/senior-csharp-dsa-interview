# Data Processing Interview Simulation

## Scenario

You are joining a small commerce platform team. The platform exports order data from its order service and shipment events from its logistics provider. Your job is to produce a few business reports from those exports before the next operations review.

`data/orders.json` contains orders and their line items. Dates are UTC ISO-8601 values. Money is represented in the currency unit used by the business. `data/shipment-events.csv` contains shipment events; an order may have several events, events may be out of chronological order, and the two exports do not necessarily contain the same order IDs.

The sample files are intentionally small enough to inspect during an interview, but they include cancelled and refunded orders, missing optional values, empty collections, invalid values, duplicate-looking events, and ties.

## Tasks

Implement the operations exposed by `OrderAnalyzer` in the source project. The operations are ordered from shorter warm-up work to more involved data processing.

### 1. Completed order summaries

For a requested region, return summaries for completed orders in that region only. Each summary must contain the order ID, order date, number of valid items, and the order total after the order discount. Ignore invalid line items: a line is valid only when its quantity is positive, its unit price is not negative, and it has a product ID. A missing item collection contributes no valid items.

Sort summaries by order date ascending, then order ID ascending. The order total is the sum of valid line totals, reduced by the order discount. Treat a discount below zero as zero and a discount above one as one.

### 2. Customer spend

Return total spend per customer for completed orders. Use the same valid-line and discount rules as Task 1. Include customers whose valid total is zero, and do not create an entry for an order with a missing customer ID. The result must be deterministic when it is enumerated.

Cancelled, refunded, and partially fulfilled orders do not contribute to this report.

### 3. Product sales ranking

Return up to `limit` products sold by completed orders. Combine rows for the same product ID, including rows where the product appears in more than one order. Report total quantity and discounted revenue allocated proportionally across the valid lines in each order. Use the first non-empty product name encountered for a product; if none exists, use the product ID.

Rank by revenue descending, then quantity descending, then product ID ascending. A non-positive limit returns no results. Invalid lines and orders with no valid lines do not contribute.

### 4. Delayed orders from shipment events

Return IDs of orders that are not delivered within the requested delivery window. Only consider orders with status `Completed` or `PartiallyFulfilled`. Match shipment events to those orders, ignore events with an invalid or missing timestamp, and use the latest valid event for an order. An order is delayed when it has no valid `Delivered` event by the end of the window after its order date. An order with a delivered event exactly on the boundary is on time.

Return each order ID at most once, sorted ascending. Shipment events for unknown orders must not create results. A non-positive delivery window is invalid input and should be handled consistently and safely.

## Constraints

- You have approximately 60 to 90 minutes.
- Work from the supplied files and the requirements above.
- The input collections may be empty, contain duplicates, or be larger than the sample files.
- Do not assume the input is already sorted.
- Do not mutate caller-owned collections or records.
- Preserve decimal arithmetic for monetary values.
- Decide how to handle null references and other malformed input in a way that is consistent with the requirements.
- Keep the public behavior deterministic.
- You may choose the implementation structure and supporting private helpers.
- The verification tests are intentionally incomplete; add your own tests while working.

## Expected behavior

The test project contains interviewer verification tests for the public operations. Run them after implementing each task. The tests cover ordinary examples as well as empty inputs, a single record, duplicate records, missing values, invalid values, boundary dates, ties, zero totals, and a larger generated input.

A correct implementation should also be safe to call with empty sequences and should not depend on the order in which records happen to arrive.

## Time management

Aim to complete Tasks 1 and 2 first, then Task 3, and use the remaining time for Task 4, extra tests, and cleanup. A partial implementation with clear assumptions is preferable to unfinished architecture.

## Notes

Structure the solution however you think is appropriate. Correctness and readable, maintainable C# matter more than unnecessary architecture. You may use the standard library, but do not change the requirements or the verification tests.
