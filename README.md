<div align="center">

# Java Full Stack — Module Projects

Hands-on Java projects built module by module, covering core Java, object-oriented design, file I/O, and concurrency.

![Java](https://img.shields.io/badge/Java-11%2B-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Dependencies](https://img.shields.io/badge/dependencies-none-success?style=for-the-badge)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-blue?style=for-the-badge)

</div>

---

## Projects

| # | Project | Description | Key Concepts |
|---|---------|-------------|--------------|
| 1 | [Inventory Management System](./Module%20-%201/Inventory%20Management%20System) | Menu-driven console app to manage products, categories, and stock levels with persistent storage. | OOP, Collections, Serialization, File I/O |
| 2 | [Multi-Threaded File Processor](./Module%20-%202/MultiThreadedFileProcessor) | Processes multiple CSV sales files concurrently and generates an aggregated sales report. | ExecutorService, Callable/Future, Builder Pattern, Streams |

---

## Repository Structure

```
myanatomy-java-stack/
├── Module - 1/
│   └── Inventory Management System/
│       ├── Main.java               # Console UI and menus
│       ├── InventoryManager.java   # Business logic
│       ├── Product.java            # Product model
│       ├── Category.java           # Category model
│       ├── FileManager.java        # Serialization-based persistence
│       └── products.dat            # Sample data
│
└── Module - 2/
    └── MultiThreadedFileProcessor/
        ├── src/                    # Java source (config, model, processor, report)
        ├── data/                   # Sample CSV input files
        ├── run.sh                  # Build & run (macOS / Linux)
        └── run.bat                 # Build & run (Windows)
```

---

## Getting Started

### Prerequisites

- **JDK 11 or later** — verify with:

  ```bash
  java -version
  javac -version
  ```

No build tools or external libraries are required. Every project compiles with plain `javac`.

### Clone

```bash
git clone https://github.com/Deepanshxsharma/myanatomy-java-stack.git
cd myanatomy-java-stack
```

### Run a Project

**Module 1 — Inventory Management System**

```bash
cd "Module - 1/Inventory Management System"
javac *.java
java Main
```

**Module 2 — Multi-Threaded File Processor**

```bash
cd "Module - 2/MultiThreadedFileProcessor"
./run.sh          # macOS / Linux
run.bat           # Windows
```

See each project's README for detailed usage and design notes.

---

## Concepts Covered

- **Object-Oriented Programming** — encapsulation, models, separation of concerns
- **Collections Framework** — `List`, `Map`, `TreeMap`, `ArrayList`
- **File I/O** — object serialization, buffered CSV reading, report writing
- **Concurrency** — thread pools, `Callable`, `Future`, graceful shutdown
- **Design Patterns** — Builder pattern for immutable configuration
- **Functional Java** — lambdas, method references, Stream API
- **Input Validation** — defensive parsing and error handling

---

<div align="center">

Maintained by [Deepansh Sharma](https://github.com/Deepanshxsharma)

</div>
