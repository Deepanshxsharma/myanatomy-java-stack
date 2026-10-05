# Multi-Threaded CSV File Processor

A concurrent Java application that reads multiple CSV sales files in parallel with a thread pool, merges the results, and produces an aggregated sales report on the console and in `report.txt`.

![Java](https://img.shields.io/badge/Java-11%2B-ED8B00?logo=openjdk&logoColor=white)
![Module](https://img.shields.io/badge/Module-2-blue)

---

## Features

- **Parallel processing:** each CSV file is parsed on its own worker thread using a fixed-size `ExecutorService`
- **Builder-based configuration:** thread count, input folder, output file, header handling, and delimiter
- **Aggregated analytics:** total revenue, total quantity, averages, top-selling product, and top revenue category
- **Category breakdowns:** revenue and units sold per category
- **Fault tolerance:** malformed rows are logged and skipped without stopping the run
- **Auto-discovery:** every `.csv` file in `data/` is processed automatically

---

## How It Works

```
                    ┌──────────────────────────┐
                    │  ProcessorConfig.Builder │
                    └────────────┬─────────────┘
                                 ▼
 data/*.csv ──▶  ExecutorService (fixed thread pool)
                 ├── CsvFileProcessor ──▶ Future<List<SalesRecord>>
                 ├── CsvFileProcessor ──▶ Future<List<SalesRecord>>
                 └── CsvFileProcessor ──▶ Future<List<SalesRecord>>
                                 │
                                 ▼
                       ReportAggregator ──▶ console + report.txt
```

1. Build an immutable `ProcessorConfig` with the Builder pattern.
2. Find every `.csv` file in the input folder.
3. Submit one `CsvFileProcessor` (a `Callable`) per file to the thread pool.
4. Collect each file's records through its `Future`.
5. Shut down the pool cleanly.
6. Aggregate the records and write the report.

---

## Project Structure

```
MultiThreadedFileProcessor/
├── src/
│   ├── Main.java                       # Entry point and orchestration
│   ├── config/ProcessorConfig.java     # Immutable config + Builder
│   ├── model/SalesRecord.java          # One CSV row
│   ├── processor/CsvFileProcessor.java # Callable that parses one file
│   └── report/ReportAggregator.java    # Aggregation and report output
├── data/
│   ├── sales_january.csv
│   ├── sales_february.csv
│   └── sales_march.csv
├── report.txt                          # Sample generated report
├── run.sh                              # Build & run (macOS / Linux)
└── run.bat                             # Build & run (Windows)
```

---

## Getting Started

**Requirements:** JDK 11 or later (`java -version` to check)

### Quick Run

```bash
cd "Module - 2/MultiThreadedFileProcessor"

./run.sh      # macOS / Linux
run.bat       # Windows (or double-click it)
```

### Manual Build

Run these from the project root so the `data/` folder is found.

```bash
javac -d out src/Main.java src/model/SalesRecord.java src/config/ProcessorConfig.java \
    src/processor/CsvFileProcessor.java src/report/ReportAggregator.java
java -cp out Main
```

On Windows, use `\` instead of `/` in the paths.

---

## Sample Output

```
[Thread: pool-1-thread-1] Processing: data/sales_february.csv
[Thread: pool-1-thread-2] Processing: data/sales_january.csv
[Thread: pool-1-thread-3] Processing: data/sales_march.csv
...
=======================================================
       SALES AGGREGATED REPORT
=======================================================

  Total Records Processed : 25
  Total Quantity Sold     : 915 units
  Total Revenue           : $57,650.85
  Average Revenue/Record  : $2,306.03

  Top-Selling Product     : Socks
  Top Revenue Category    : Electronics
```

The full report, including per-category breakdowns, is saved to `report.txt`.

---

## Input Format

Each CSV file must have a header row followed by data rows:

```csv
product,category,quantity,price
Laptop,Electronics,5,999.99
T-Shirt,Clothing,20,19.99
```

Drop additional `.csv` files into `data/` and they'll be picked up on the next run.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `java` / `javac` not found | Install a JDK (not just a JRE) and make sure it's on your `PATH` |
| `No CSV files found` | Run from the project root; confirm `data/` contains `.csv` files |
| `permission denied: ./run.sh` | Run `chmod +x run.sh` once |
| Window closes instantly (Windows) | Run `run.bat` from Command Prompt instead of double-clicking |

---

## Concepts Demonstrated

- `ExecutorService`, `Callable`, and `Future` for concurrent tasks
- Builder pattern for immutable configuration objects
- Stream API and `Map.merge` for aggregation
- `try-with-resources` for buffered file reading and writing
- Packaged source layout (`config`, `model`, `processor`, `report`)
